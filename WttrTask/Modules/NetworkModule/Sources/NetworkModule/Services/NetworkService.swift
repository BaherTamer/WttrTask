//
//  NetworkService.swift
//  NetworkModule
//
//  Created by Baher Tamer on 27/08/2026.
//

import Foundation

public protocol NetworkService {
    func request(with endpoint: Endpoint) async throws -> Data
}
