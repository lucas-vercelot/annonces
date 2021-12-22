//
//  AnnoncesEntitiesAdCategoryDecodingTests.swift
//  AnnoncesTests
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import XCTest
@testable import Annonces_Entities

class AnnoncesEntitiesAdCategoryDecodingTests: XCTestCase, DecodingTestable {
    
    var data: Data!
    
    // MARK: - Given one valid AdCategory
    
    func test__givenJSONWithOneValidAdCategory__decoding_should_succeed() {
        // Given
        givenJSONWithOneValidAdCategory()
        
        // When
        let decoder = JSONDecoder()
        let adCategory = try? decoder.decode(AdCategory.self, from: data)
        
        // Then
        XCTAssertNotNil(adCategory)
        XCTAssertEqual(
            adCategory,
            AdCategory(id: 1, name: "Véhicule")
        )
    }
    
    // MARK: - Given one AdCategory with wrong id type
    
    func test__givenJSONWithOneAdCategoryWithWrongIdType__decoding_should_fail() {
        // Given
        givenJSONWithOneAdCategoryWithWrongIdType()
        
        // When
        let decoder = JSONDecoder()
        let adCategory = try? decoder.decode(AdCategory.self, from: data)
        
        // Then
        XCTAssertNil(adCategory)
    }
    
    // MARK: - Given one AdCategory with wrong name type
    
    func test__givenJSONWithOneAdCategoryWithWrongNameType__decoding_should_fail() {
        // Given
        givenJSONWithOneAdCategoryWithWrongNameType()
        
        // When
        let decoder = JSONDecoder()
        let adCategory = try? decoder.decode(AdCategory.self, from: data)
        
        // Then
        XCTAssertNil(adCategory)
    }
    
    // MARK: - Given one AdCategory with null id
    
    func test__givenJSONWithOneAdCategoryWithNullId__decoding_should_fail() {
        // Given
        givenJSONWithOneAdCategoryWithNullId()
        
        // When
        let decoder = JSONDecoder()
        let adCategory = try? decoder.decode(AdCategory.self, from: data)
        
        // Then
        XCTAssertNil(adCategory)
    }
    
    // MARK: - Given one AdCategory with missing name
    
    func test__givenJSONWithOneAdCategoryWithMissingName__decoding_should_fail() {
        // Given
        givenJSONWithOneAdCategoryWithMissingName()
        
        // When
        let decoder = JSONDecoder()
        let adCategory = try? decoder.decode(AdCategory.self, from: data)
        
        // Then
        XCTAssertNil(adCategory)
    }
    
    // MARK: - Given one AdCategory with id equal to zero
    
    func test__givenJSONWithOneAdCategoryWithIdEqualToZero__decoding_should_succeed() {
        // Given
        givenJSONWithOneAdCategoryWithIdEqualToZero()
        
        // When
        let decoder = JSONDecoder()
        let adCategory = try? decoder.decode(AdCategory.self, from: data)
        
        // Then
        XCTAssertNotNil(adCategory)
        XCTAssertEqual(
            adCategory,
            AdCategory(id: 0, name: "Véhicule")
        )
    }
    
    // MARK: - Given one AdCategory with negative id
    
    func test__givenJSONWithOneAdCategoryWithNegativeId__decoding_should_fail() {
        // Given
        givenJSONWithOneAdCategoryWithNegativeId()
        
        // When
        let decoder = JSONDecoder()
        let adCategory = try? decoder.decode(AdCategory.self, from: data)
        
        // Then
        XCTAssertNil(adCategory)
    }
    
    // MARK: - Given one AdCategory with UInt64 overflow id
    
    func test__givenJSONWithOneAdCategoryWithUInt64OverflowId__decoding_should_fail() {
        // Given
        givenJSONWithOneAdCategoryWithUInt64OverflowId()
        
        // When
        let decoder = JSONDecoder()
        let adCategory = try? decoder.decode(AdCategory.self, from: data)
        
        // Then
        XCTAssertNil(adCategory)
    }
}

// MARK: - AnnoncesEntitiesAdCategoryDecodingTests JSON Mocks

extension AnnoncesEntitiesAdCategoryDecodingTests {
    
    // MARK: - MOCK Given one valid AdCategory
    
    private func givenJSONWithOneValidAdCategory() {
        let json =
        """
        {
            "id": 1,
            "name": "Véhicule"
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one AdCategory with wrong id type
    
    private func givenJSONWithOneAdCategoryWithWrongIdType() {
        let json =
        """
        {
            "id": "1",
            "name": "Véhicule"
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one AdCategory with wrong name type
    
    private func givenJSONWithOneAdCategoryWithWrongNameType() {
        let json =
        """
        {
            "id": 1,
            "name": true
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one AdCategory with null id
    
    private func givenJSONWithOneAdCategoryWithNullId() {
        let json =
        """
        {
            "id": null,
            "name": "Véhicule"
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one AdCategory with missing name
    
    private func givenJSONWithOneAdCategoryWithMissingName() {
        let json =
        """
        {
            "id": 1
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one AdCategory with id equal to zero
    
    private func givenJSONWithOneAdCategoryWithIdEqualToZero() {
        let json =
        """
        {
            "id": 0,
            "name": "Véhicule"
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one AdCategory with negative id
    
    private func givenJSONWithOneAdCategoryWithNegativeId() {
        let json =
        """
        {
            "id": -42,
            "name": "Véhicule"
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one AdCategory with UInt64 overflow id
    
    private func givenJSONWithOneAdCategoryWithUInt64OverflowId() {
        let json =
        """
        {
            "id": 18446744073709551616,
            "name": "Véhicule"
        }
        """
        
        makeData(with: json)
    }
}
