//
//  RESTNetworkService.swift
//  NetworkModule
//
//  Created by Baher Tamer on 27/08/2026.
//

import Foundation

public struct RESTNetworkService: NetworkService {
    // MARK: - Inputs
    private let baseURL: String
    
    // MARK: - Life Cycle
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
}

// MARK: - Core Functions
extension RESTNetworkService {
    public func request(with endpoint: Endpoint) async throws -> Data {
        let request = try createURLRequest(from: endpoint)
        let (data, response) = try await fetchData(with: request)
        try validateResponse(response, data: data)
        return data
    }
}

// MARK: - Private Helpers
extension RESTNetworkService {
    private func createURLRequest(from endpoint: Endpoint) throws -> URLRequest {
        do {
            return try endpoint.buildURLRequest(with: baseURL)
        } catch {
            throw NetworkError.invalidURL
        }
    }

    private func fetchData(with request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await URLSession.shared.data(for: request)
        } catch let error as URLError {
            throw mapURLError(error)
        } catch {
            throw NetworkError.transportFailure
        }
    }

    private func mapURLError(_ error: URLError) -> NetworkError {
        switch error.code {
        case .notConnectedToInternet,
             .networkConnectionLost,
             .dataNotAllowed,
             .cannotFindHost,
             .cannotConnectToHost,
             .timedOut,
             .internationalRoamingOff:
            .noConnection
        default:
            .transportFailure
        }
    }

    private func validateResponse(_ response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.transportFailure
        }
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.unacceptableStatus(
                code: httpResponse.statusCode,
                body: String(decoding: data, as: UTF8.self)
            )
        }
    }
}
