//
//  ImagesURL.swift
//  Annonces_Entities
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import Foundation

public extension ClassifiedAd {
    struct ImagesURL: Decodable {
        public let small: URL
        public let thumbnail: URL
    }
}

private extension ClassifiedAd.ImagesURL {
    private enum CodingKeys: String, CodingKey {
        case small
        case thumbnail = "thumb"
    }
}

public extension ClassifiedAd.ImagesURL {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        small = try values.decode(URL.self, forKey: .small)
        thumbnail = try values.decode(URL.self, forKey: .thumbnail)
    }
}

// MARK: - Equatable

extension ClassifiedAd.ImagesURL: Equatable {}
