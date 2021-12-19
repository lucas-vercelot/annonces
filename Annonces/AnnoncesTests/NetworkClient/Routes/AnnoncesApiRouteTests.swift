//
//  AnnoncesApiRouteTests.swift
//  AnnoncesTests
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import XCTest
@testable import Annonces

class LiberationApiRouteTests: XCTestCase {
    
    func test__adCategoriesAction_route_params() {
        let action = AnnoncesApiAction.adCategories
        let route = AnnoncesApiRoute(action: action)

        XCTAssertEqual(route.endpoint, "categories.json")
        XCTAssertEqual(route.method, AnnoncesApiRoute.HTTPMethod.get)
        XCTAssertEqual(route.responseTimeout, TimeInterval(5.0))
    }
    
    func test__classifiedAdAction_route_params() {
        let action = AnnoncesApiAction.classifiedAds
        let route = AnnoncesApiRoute(action: action)

        XCTAssertEqual(route.endpoint, "listing.json")
        XCTAssertEqual(route.method, AnnoncesApiRoute.HTTPMethod.get)
        XCTAssertEqual(route.responseTimeout, TimeInterval(5.0))
    }
}
