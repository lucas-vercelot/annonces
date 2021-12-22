//
//  AdCategory.swift
//  Annonce_Entities
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import Foundation

public struct AdCategory: Decodable {
    public let id: UInt64
    public let name: String
}

private extension AdCategory {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

public extension AdCategory {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(UInt64.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
    }
}

// MARK: - Equatable

extension AdCategory: Equatable {}
