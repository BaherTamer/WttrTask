//
//  NetworkFactory.swift
//  NetworkModule
//
//  Created by Baher Tamer on 27/08/2026.
//

import FactoryKit
import Foundation

public extension Container {
    var networkService: Factory<NetworkService> {
        self {
            RESTNetworkService(
                baseURL: self.baseURL()
            )
        }
        .singleton
    }
}

// MARK: - Private Helpers
extension Container {
    private var baseURL: Factory<String> {
        self {
            guard
                let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String,
                !url.isEmpty
            else {
                fatalError("Missing or invalid BASE_URL in Info.plist. Please set a non-empty string for the BASE_URL key in your target's Info.plist (per configuration).")
            }
            return url
        }
        .singleton
    }
}
