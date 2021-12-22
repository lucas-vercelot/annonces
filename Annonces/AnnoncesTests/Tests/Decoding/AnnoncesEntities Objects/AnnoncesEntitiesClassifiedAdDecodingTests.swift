//
//  AnnoncesEntitiesClassifiedAdDecodingTests.swift
//  AnnoncesTests
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import XCTest
@testable import Annonces_Entities

class AnnoncesEntitiesClassifiedAdDecodingTests: XCTestCase, DecodingTestable {
    
    var data: Data!
    
    // MARK: - Given one valid ClassifiedAd
    
    func test__givenJSONWithOneValidClassifiedAd__decoding_should_succeed() {
        // Given
        givenJSONWithOneValidClassifiedAd()
        
        // When
        let decoder = JSONDecoder()
        let classifiedAd = try? decoder.decode(ClassifiedAd.self, from: data)
        
        // Then
        XCTAssertNotNil(classifiedAd)
        XCTAssertEqual(
            classifiedAd,
            ClassifiedAd(
                id: 1461267313,
                title: "Statue homme noir assis en plâtre polychrome",
                categoryId: 4,
                creationDate: DateFormatter.classifiedAdDateFormatter.date(from: "2019-11-05T15:56:59+0000")!,
                description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.",
                isUrgent: false,
                imagesURL: ClassifiedAd.ImagesURL(
                    small: URL(string: "https://awesomeImages/small.jpg")!,
                    thumbnail: URL(string: "https://awesomeImages/thumb.jpg")!
                ),
                price: 140.00
            )
        )
    }
    
    // MARK: - Given one ClassifiedAd with wrong id type
    
    func test__givenJSONWithOneClassifiedAdWithWrongIdType__decoding_should_fail() {
        // Given
        givenJSONWithOneClassifiedAdWithWrongIdType()
        
        // When
        let decoder = JSONDecoder()
        let classifiedAd = try? decoder.decode(ClassifiedAd.self, from: data)
        
        // Then
        XCTAssertNil(classifiedAd)
    }
    
    // MARK: - Given one ClassifiedAd with missing price

    func test__givenJSONWithOneClassifiedAdWithMissingPrice__decoding_should_fail() {
        // Given
        givenJSONWithOneClassifiedAdWithMissingPrice()
        
        // When
        let decoder = JSONDecoder()
        let classifiedAd = try? decoder.decode(ClassifiedAd.self, from: data)
        
        // Then
        XCTAssertNil(classifiedAd)
    }
    
    // MARK: - Given one ClassifiedAd with wrong date format

    func test__givenJSONWithOneClassifiedAdWithWrongDateFormat__decoding_should_fail() {
        // Given
        givenJSONWithOneClassifiedAdWithWrongDateFormat()
        
        // When
        let decoder = JSONDecoder()
        let classifiedAd = try? decoder.decode(ClassifiedAd.self, from: data)
        
        // Then
        XCTAssertNil(classifiedAd)
    }
}

// MARK: - AnnoncesEntitiesClassifiedAdDecodingTests JSON Mocks

extension AnnoncesEntitiesClassifiedAdDecodingTests {
    
    // MARK: - MOCK Given one valid ClassifiedAd
    
    private func givenJSONWithOneValidClassifiedAd() {
        let json =
        """
        {
            "id": 1461267313,
            "category_id": 4,
            "title": "Statue homme noir assis en plâtre polychrome",
            "description": "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.",
            "price": 140.00,
            "images_url": {
                "small": "https://awesomeImages/small.jpg",
                "thumb": "https://awesomeImages/thumb.jpg"
            },
            "creation_date": "2019-11-05T15:56:59+0000",
            "is_urgent": false
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one ClassifiedAd with wrong id type
    
    private func givenJSONWithOneClassifiedAdWithWrongIdType() {
        let json =
        """
        {
            "id": "1461267313",
            "category_id": 4,
            "title": "Statue homme noir assis en plâtre polychrome",
            "description": "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.",
            "price": 140.00,
            "images_url": {
                "small": "https://awesomeImages/small.jpg",
                "thumb": "https://awesomeImages/thumb.jpg"
            },
            "creation_date": "2019-11-05T15:56:59+0000",
            "is_urgent": false
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one ClassifiedAd with missing price
    
    private func givenJSONWithOneClassifiedAdWithMissingPrice() {
        let json =
        """
        {
            "id": 1461267313,
            "category_id": 4,
            "title": "Statue homme noir assis en plâtre polychrome",
            "description": "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.",
            "images_url": {
                "small": "https://awesomeImages/small.jpg",
                "thumb": "https://awesomeImages/thumb.jpg"
            },
            "creation_date": "2019-11-05T15:56:59+0000",
            "is_urgent": false
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one ClassifiedAd with wrong date format
    
    private func givenJSONWithOneClassifiedAdWithWrongDateFormat() {
        let json =
        """
        {
            "id": 1461267313,
            "category_id": 4,
            "title": "Statue homme noir assis en plâtre polychrome",
            "description": "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.",
            "price": 140.00,
            "images_url": {
                "small": "https://awesomeImages/small.jpg",
                "thumb": "https://awesomeImages/thumb.jpg"
            },
            "creation_date": "2019-11-05 15h56",
            "is_urgent": false
        }
        """
        
        makeData(with: json)
    }
}
