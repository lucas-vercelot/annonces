//
//  NetworkClient.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import Combine
import Annonces_Entities

protocol NetworkClient {
//    func requestCategories(completion: @escaping ((ResponseList<AdCategory>?) -> Void))
//    func requestClassifiedAds(completion: @escaping ((ResponseList<ClassifiedAd>?) -> Void))
    func fetchAdsAndCategories(completion: @escaping (([AdCategory], [ClassifiedAd])) -> Void)
}

class NetworkClientImpl: NetworkClient {
    
    // MARK: - Vars
    
    private var requests = Set<AnyCancellable>()
    private var categoriesAndClassifiedAds = ([AdCategory](), [ClassifiedAd]())

    // MARK: - Init
    
    static let shared = NetworkClientImpl()
    
    private init() {}

    // MARK: - Requests

    func fetchAdsAndCategories(completion: @escaping (([AdCategory], [ClassifiedAd])) -> Void) {
        let adCategoriesRoute = AnnoncesApiRoute(action: .adCategories)
        let classifiedAdsRoute = AnnoncesApiRoute(action: .classifiedAds)
        
        guard let adCategoriesRouteEndpoint = adCategoriesRoute.endpoint,
              let adCategoriesRequestURL = URL(string: Constants.baseURL + adCategoriesRouteEndpoint),
              let classifiedAdsRouteEndpoint = classifiedAdsRoute.endpoint,
              let classifiedAdsRequestURL = URL(string: Constants.baseURL + classifiedAdsRouteEndpoint) else {
                  return
              }
        
        let adCategoriesTask = fetchAdCategories(from: adCategoriesRequestURL, defaultValue: ResponseList<AdCategory>())

        let classifiedAdsTask = fetchClassifiedAds(from: classifiedAdsRequestURL, defaultValue: ResponseList<ClassifiedAd>())
        
        let combined = Publishers.Zip(adCategoriesTask, classifiedAdsTask)

        combined.sink { loadedAdCategories, loadedClassifiedAds in
            self.categoriesAndClassifiedAds = (loadedAdCategories.elements, loadedClassifiedAds.elements)
            completion(self.categoriesAndClassifiedAds)
        }
        .store(in: &requests)
    }
    
    func fetchAdCategories(from url: URL, defaultValue: ResponseList<AdCategory>) -> AnyPublisher<ResponseList<AdCategory>, Never> {
    
        let decoder = JSONDecoder()

        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: ResponseList<AdCategory>.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchClassifiedAds(from url: URL, defaultValue: ResponseList<ClassifiedAd>) -> AnyPublisher<ResponseList<ClassifiedAd>, Never> {
    
        let decoder = JSONDecoder()

        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: ResponseList<ClassifiedAd>.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

// MARK: - Constants Extension

private extension NetworkClientImpl {
    enum Constants {
        static let baseURL: String = "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
    }
}
