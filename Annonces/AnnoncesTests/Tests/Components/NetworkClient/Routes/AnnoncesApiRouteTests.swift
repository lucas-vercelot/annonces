//
//  AnnoncesApiRouteTests.swift
//  AnnoncesTests
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import XCTest
@testable import Annonces

class AnnoncesApiRouteTests: XCTestCase {
    
    func test__adCategoriesAction_route_params() {
        let action = AnnoncesApiAction.adCategories
        let route = AnnoncesApiRoute(action: action)

        XCTAssertEqual(route.endpoint, "categories.json")
    }
    
    func test__classifiedAdAction_route_params() {
        let action = AnnoncesApiAction.classifiedAds
        let route = AnnoncesApiRoute(action: action)

        XCTAssertEqual(route.endpoint, "listing.json")
    }
}
