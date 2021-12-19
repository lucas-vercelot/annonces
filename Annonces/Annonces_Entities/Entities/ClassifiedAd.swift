//
//  ClassifiedAd.swift
//  Annonce_Entities
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import Foundation

public struct ClassifiedAd: Decodable {
    public let id: UInt64
    public let title: String
    public let categoryId: UInt64
    public let creationDate: Date
    public let description: String
    public let isUrgent: Bool
    public let imagesURL: ClassifiedAd.ImagesURL
    public let price: Float
}

private extension ClassifiedAd {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case categoryId = "category_id"
        case creationDate = "creation_date"
        case description
        case isUrgent = "is_urgent"
        case imagesURL = "images_url"
        case price
    }
}

public extension ClassifiedAd {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(UInt64.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        categoryId = try values.decode(UInt64.self, forKey: .categoryId)
        creationDate = try values.decodeClassifiedAdDateFromString(forKey: .creationDate)
        description = try values.decode(String.self, forKey: .description)
        isUrgent = try values.decode(Bool.self, forKey: .isUrgent)
        imagesURL = try values.decode(ImagesURL.self, forKey: .imagesURL)
        price = try values.decode(Float.self, forKey: .price)
    }
}

// MARK: - Equatable

extension ClassifiedAd: Equatable {}
