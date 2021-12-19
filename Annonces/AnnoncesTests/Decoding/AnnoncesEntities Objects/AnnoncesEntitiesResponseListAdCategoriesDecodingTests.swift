//
//  AnnoncesEntitiesResponseListAdCategoriesDecodingTests.swift
//  AnnoncesTests
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import XCTest
@testable import Annonces_Entities

class AnnoncesEntitiesResponseListAdCategoriesDecodingTests: XCTestCase, DecodingTestable {
    
    var data: Data!

    // MARK: - Given a valid list of eleven AdCategories

    func test__givenJSONWithAValidListOfElevenAdCategories__decoding_should_succeed() {
        // Given
        givenJSONWithAValidListOfElevenAdCategories()
        
        // When
        let decoder = JSONDecoder()
        let adCategories = try? decoder.decode(ResponseList<AdCategory>.self, from: data)

        // Then
        XCTAssertNotNil(adCategories)
        XCTAssertEqual(adCategories?.elements.count, 11)
    }
    
    // MARK: - Given a list of seven valid and four invalid AdCategories

    func test__givenJSONWithAListOfSevenValidAndFourInvalidAdCategories__list_count_should_equal_7() {
        // Given
        givenJSONWithAListOfSevenValidAndFourInvalidAdCategories()
        
        // When
        let decoder = JSONDecoder()
        let adCategories = try? decoder.decode(ResponseList<AdCategory>.self, from: data)
        
        // Then
        XCTAssertNotNil(adCategories)
        XCTAssertEqual(adCategories?.elements.count, 7)
    }
    
    // MARK: - Given an empty list of AdCategories

    func test__givenJSONWithAnEmptyListOfAdCategories__list_should_not_be_nil() {
        // Given
        givenJSONWithAnEmptyListOfAdCategories()
        
        // When
        let decoder = JSONDecoder()
        let adCategories = try? decoder.decode(ResponseList<AdCategory>.self, from: data)
        
        // Then
        XCTAssertNotNil(adCategories)
        XCTAssertEqual(adCategories?.elements.count, 0)
    }
}

// MARK: - AnnoncesEntitiesResponseListAdCategoriesDecodingTests JSON Mocks

extension AnnoncesEntitiesResponseListAdCategoriesDecodingTests {
    
    // MARK: - MOCK Given a valid list of eleven AdCategories
    
    private func givenJSONWithAValidListOfElevenAdCategories() {
        let json =
        """
        [
            {
                "id": 1,
                "name": "Véhicule"
            },
            {
                "id": 2,
                "name": "Mode"
            },
            {
                "id": 3,
                "name": "Bricolage"
            },
            {
                "id": 4,
                "name": "Maison"
            },
            {
                "id": 5,
                "name": "Loisirs"
            },
            {
                "id": 6,
                "name": "Immobilier"
            },
            {
                "id": 7,
                "name": "Livres/CD/DVD"
            },
            {
                "id": 8,
                "name": "Multimédia"
            },
            {
                "id": 9,
                "name": "Service"
            },
            {
                "id": 10,
                "name": "Animaux"
            },
            {
                "id": 11,
                "name": "Enfants"
            }
        ]
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given a list of seven valid and four invalid AdCategories
    
    private func givenJSONWithAListOfSevenValidAndFourInvalidAdCategories() {
        let json =
        """
        [
            {
                "id": 1,
                "name": "Véhicule"
            },
            {
                "id": 2,
                "name": "Mode"
            },
            {
                "id": "3",
                "name": "Bricolage"
            },
            {
                "id": 4,
                "name": "Maison"
            },
            {
                "id": 5,
                "name": "Loisirs"
            },
            {
                "id": 6,
                "name": "Immobilier"
            },
            {
                "id": "7",
                "name": "Livres/CD/DVD"
            },
            {
                "id": 8,
                "name": "Multimédia"
            },
            {
                "id": 9,
                "name": null
            },
            {
                "id": 10,
                "name": "Animaux"
            },
            {
                "id": null,
                "name": "Enfants"
            }
        ]
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given an empty list of AdCategories
    
    private func givenJSONWithAnEmptyListOfAdCategories() {
        let json =
        """
        [
        ]
        """
        
        makeData(with: json)
    }
}
