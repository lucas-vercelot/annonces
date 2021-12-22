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
    func fetchAdCategoriesAndClassifiedAds(completion: @escaping ((adCategories: [AdCategory], classifiedAds: [ClassifiedAd])) -> Void)
}

class NetworkClientImpl: NetworkClient {
    
    // MARK: - Vars
    
    private var requests = Set<AnyCancellable>()
    private var categoriesAndClassifiedAds = ([AdCategory](), [ClassifiedAd]())

    // MARK: - Init
    
    static let shared = NetworkClientImpl()
    
    private init() {}

    // MARK: - Requests

    func fetchAdCategoriesAndClassifiedAds(completion: @escaping ((adCategories: [AdCategory], classifiedAds: [ClassifiedAd])) -> Void) {
        let adCategoriesRoute = AnnoncesApiRoute(action: .adCategories)
        let classifiedAdsRoute = AnnoncesApiRoute(action: .classifiedAds)
        
        guard let adCategoriesRouteEndpoint = adCategoriesRoute.endpoint,
              let adCategoriesRequestURL = URL(string: Constants.baseURL + adCategoriesRouteEndpoint),
              let classifiedAdsRouteEndpoint = classifiedAdsRoute.endpoint,
              let classifiedAdsRequestURL = URL(string: Constants.baseURL + classifiedAdsRouteEndpoint) else {
                  return
              }
        
        let adCategoriesTask = fetchData(from: adCategoriesRequestURL, defaultValue: ResponseList<AdCategory>())
        let classifiedAdsTask = fetchData(from: classifiedAdsRequestURL, defaultValue: ResponseList<ClassifiedAd>())
        
        let combined = Publishers.Zip(adCategoriesTask, classifiedAdsTask)

        // Closure triggered whenever the two puslishers zipped are received.
        combined.sink { loadedAdCategories, loadedClassifiedAds in
            self.categoriesAndClassifiedAds = (loadedAdCategories.elements, loadedClassifiedAds.elements)
            completion(self.categoriesAndClassifiedAds)
        }
        .store(in: &requests)
    }
    
    /// Fetches any decodable type of object provided.
    /// - Returns: a Combine Publisher composed of the requested type and a `Never` error because its given a default value in case of failure.
    func fetchData<T: Decodable>(from url: URL, defaultValue: T) -> AnyPublisher<T, Never> {
        let decoder = JSONDecoder()

        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
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
