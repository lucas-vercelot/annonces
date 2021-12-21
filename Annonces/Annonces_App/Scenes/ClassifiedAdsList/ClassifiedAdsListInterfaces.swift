//
//  ClassifiedAdsListInterfaces.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import Annonces_Entities

// MARK: - View Controller

protocol ClassifiedAdsListDisplayable: AnyObject {
    func displayClassifiedAds(with viewModel: ClassifiedAdsListModels.ViewModel)
}

// MARK: - Interactor

protocol ClassifiedAdsListInteractable {
    func loadClassifiedAds()
}

// MARK: - Presenter

protocol ClassifiedAdsListPresentable {
    func presentClassifiedAds(with response: ClassifiedAdsListModels.Response)
}

// MARK: - Router

protocol ClassifiedAdsListRoutable {
    func showClassifiedAdDetail(for enrichedClassifiedAd: EnrichedClassifiedAd)
}
