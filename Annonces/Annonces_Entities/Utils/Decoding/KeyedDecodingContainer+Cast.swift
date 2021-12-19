//
//  KeyedDecodingContainer+Cast.swift
//  Annonces_Entities
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import Foundation

extension KeyedDecodingContainer {
    
    // MARK: - Date
    
    public func decodeClassifiedAdDateFromString(forKey key: K) throws -> Date {
        let dateInString = try decode(String.self, forKey: key)
        guard let date = DateFormatter.classifiedAdDateFormatter.date(from: dateInString) else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "value of key \(key) can't be formatted to Date.")
        }
        return date
    }
}
