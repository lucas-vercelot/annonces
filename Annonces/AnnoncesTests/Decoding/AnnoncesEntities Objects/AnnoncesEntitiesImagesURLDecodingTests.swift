//
//  AnnoncesEntitiesImagesURLDecodingTests.swift
//  AnnoncesTests
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import XCTest
@testable import Annonces_Entities

class AnnoncesEntitiesImagesURLDecodingTests: XCTestCase, DecodingTestable {
    
    var data: Data!
    
    // MARK: - Given one valid ImagesURL
    
    func test__givenJSONWithOneValidImagesURL__decoding_should_succeed() {
        // Given
        givenJSONWithOneValidImagesURL()
        
        // When
        let decoder = JSONDecoder()
        let imagesURL = try? decoder.decode(ClassifiedAd.ImagesURL.self, from: data)
        
        // Then
        XCTAssertNotNil(imagesURL)
        XCTAssertEqual(
            imagesURL,
            ClassifiedAd.ImagesURL(small: URL(string: "https://awesomeImages/small.jpg")!,
                                   thumbnail: URL(string: "https://awesomeImages/thumb.jpg")!)
        )
    }
    
    // MARK: - Given one ImagesURL with null thumb URL
    
    func test__givenJSONWithOneImagesURLWithNullThumbURL__decoding_should_fail() {
        // Given
        givenJSONWithOneImagesURLWithNullThumbURL()
        
        // When
        let decoder = JSONDecoder()
        let imagesURL = try? decoder.decode(ClassifiedAd.ImagesURL.self, from: data)
        
        // Then
        XCTAssertNil(imagesURL)
    }
    
    // MARK: - Given one ImagesURL with null small URL
    
    func test__givenJSONWithOneImagesURLWithNullSmallURL__decoding_should_fail() {
        // Given
        givenJSONWithOneImagesURLWithNullSmallURL()
        
        // When
        let decoder = JSONDecoder()
        let imagesURL = try? decoder.decode(ClassifiedAd.ImagesURL.self, from: data)
        
        // Then
        XCTAssertNil(imagesURL)
    }
}

// MARK: - AnnoncesEntitiesImagesURLDecodingTests JSON Mocks

extension AnnoncesEntitiesImagesURLDecodingTests {
    
    // MARK: - MOCK Given one valid ImagesURL
    
    private func givenJSONWithOneValidImagesURL() {
        let json =
        """
        {
            "small": "https://awesomeImages/small.jpg",
            "thumb": "https://awesomeImages/thumb.jpg"
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one ImagesURL with null thumb URL
    
    private func givenJSONWithOneImagesURLWithNullThumbURL() {
        let json =
        """
        {
            "small": "https://awesomeImages/small.jpg",
            "thumb": null
        }
        """
        
        makeData(with: json)
    }
    
    // MARK: - MOCK Given one ImagesURL with null small URL
    
    private func givenJSONWithOneImagesURLWithNullSmallURL() {
        let json =
        """
        {
            "small": null,
            "thumb": "https://awesomeImages/thumb.jpg"
        }
        """
        
        makeData(with: json)
    }
}
