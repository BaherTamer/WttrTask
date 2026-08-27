//
//  Endpoint.swift
//  NetworkModule
//
//  Created by Baher Tamer on 27/08/2026.
//

import Foundation

public protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParams: [String: String]? { get }
}

// MARK: - Config Variables
extension Endpoint {
    public var headers: [String: String]? { nil }
    public var queryParams: [String: String]? { nil }
}

// MARK: - Core Functions
extension Endpoint {
    func buildURLRequest(with baseURLString: String) throws -> URLRequest {
        let requestURL = try createRequestURL(with: baseURLString)
        var request = createBaseRequest(with: requestURL)
        setRequestMethod(&request)
        setRequestHeaders(&request)
        try setRequestQueryParams(&request, requestURL: requestURL)
        return request
    }
}

// MARK: - Private Helpers
extension Endpoint {
    private func createRequestURL(with urlString: String) throws -> URL {
        let trimmedURL = urlString.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        guard
            !trimmedURL.isEmpty,
            urlString == trimmedURL,
            let baseURL = URL(string: "https://" + urlString)
        else {
            throw NetworkError.invalidURL
        }
        let requestURL = baseURL.appendingPathComponent(path)
        return requestURL
    }
    
    private func createBaseRequest(with requestURL: URL) -> URLRequest {
        URLRequest(url: requestURL)
    }

    private func setRequestMethod(_ request: inout URLRequest) {
        request.httpMethod = method.rawValue
    }

    private func setRequestHeaders(_ request: inout URLRequest) {
        request.allHTTPHeaderFields = headers
    }

    private func setRequestQueryParams(
        _ request: inout URLRequest,
        requestURL: URL
    ) throws {
        guard let queryParams else { return }
        var components = URLComponents(
            url: requestURL,
            resolvingAgainstBaseURL: false
        )
        components?.queryItems = mapQueryItems(from: queryParams)
        guard let urlWithParams = components?.url else {
            throw NetworkError.invalidURL
        }
        request.url = urlWithParams
    }

    private func mapQueryItems(from queryParams: [String: String]) -> [URLQueryItem] {
        queryParams.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
    }
}
