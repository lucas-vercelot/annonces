//
//  EnrichedClassifiedAd.swift
//  Annonces_Entities
//
//  Created by Lucas VERCELOT on 20/12/2021.
//

import Foundation

public struct EnrichedClassifiedAd {
    public let id: UInt64
    public let title: String
    public let category: AdCategory
    public let creationDate: Date
    public let description: String
    public let isUrgent: Bool
    public let imagesURL: ClassifiedAd.ImagesURL
    public let price: Float
    
    public init(from classifiedAd: ClassifiedAd, andCategory category: AdCategory) {
        self.id = classifiedAd.id
        self.title = classifiedAd.title
        self.category = category
        self.creationDate = classifiedAd.creationDate
        self.description = classifiedAd.description
        self.isUrgent = classifiedAd.isUrgent
        self.imagesURL = classifiedAd.imagesURL
        self.price = classifiedAd.price
    }
}

// MARK: - Equatable

extension EnrichedClassifiedAd: Equatable {}
