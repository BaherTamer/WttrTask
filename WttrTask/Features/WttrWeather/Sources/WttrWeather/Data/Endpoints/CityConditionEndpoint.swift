//
//  CityConditionEndpoint.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import NetworkModule

struct CityConditionEndpoint: Endpoint {
    // MARK: - Inputs
    private let city: String

    // MARK: - Life Cycle
    init(city: String) {
        self.city = city
    }

    // MARK: - Base
    var method: HTTPMethod {
        .get
    }
    
    var path: String {
        city
    }

    var headers: [String: String]? {
        ["Accept": "application/json"]
    }

    var queryParams: [String: String]? {
        ["format": "j1"]
    }
}
