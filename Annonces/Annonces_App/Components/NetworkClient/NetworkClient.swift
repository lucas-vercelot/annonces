//
//  NetworkClient.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import Annonces_Entities

protocol NetworkClient {
    func requestCategories(completion: @escaping ((ResponseList<AdCategory>?) -> Void))
    func requestClassifiedAds(completion: @escaping ((ResponseList<ClassifiedAd>?) -> Void))
}

class NetworkClientImpl: NetworkClient {
    
    // MARK: - Init
    
    static let shared = NetworkClientImpl()
    
    private init() {}

    // MARK: - Requests
    
    func requestCategories(completion: @escaping ((ResponseList<AdCategory>?) -> Void)) {
        let route = AnnoncesApiRoute(action: .adCategories)
        
        guard let routeEndpoint = route.endpoint,
              let requestURL = URL(string: Constants.baseURL + routeEndpoint) else {
                  completion(nil)
                  return
              }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = route.method.rawValue
        request.timeoutInterval = route.responseTimeout
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("An error occured trying to fetch AdCategories : \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let categories = try decoder.decode(ResponseList<AdCategory>.self, from: data)
                    completion(categories)
                } catch {
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }
        task.resume()
    }
    
    func requestClassifiedAds(completion: @escaping ((ResponseList<ClassifiedAd>?) -> Void)) {
        let route = AnnoncesApiRoute(action: .classifiedAds)
        
        guard let routeEndpoint = route.endpoint,
              let requestURL = URL(string: Constants.baseURL + routeEndpoint) else {
                  completion(nil)
                  return
              }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = route.method.rawValue
        request.timeoutInterval = route.responseTimeout
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("An error occured trying to fetch ClassifiedAds : \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let classifiedAds = try decoder.decode(ResponseList<ClassifiedAd>.self, from: data)
                    completion(classifiedAds)
                } catch {
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}

private extension NetworkClientImpl {
    enum Constants {
        static let baseURL: String = "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
    }
}
