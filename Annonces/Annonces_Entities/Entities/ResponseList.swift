//
//  ResponseList.swift
//  Annonces_Entities
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation

private struct EmptyCodable: Decodable {}

public struct ResponseList<T: Decodable & Equatable>: Decodable {
    public var elements: [T]
    
    public init(from decoder: Decoder) throws {
        var elements = [T]()
        var container = try decoder.unkeyedContainer()
        
        // Isolates elements of lists as single objects to eliminate invalid items.
        while !container.isAtEnd {
            if let decodedElement = try? container.decode(T.self) {
                elements.append(decodedElement)
            } else {
                // Skips undecodable element to move forward into the container.
                _ = try? container.decode(EmptyCodable.self)
            }
        }
        
        self.elements = elements
    }
    
    public init() {
        self.elements = []
    }
}
