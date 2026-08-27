//
//  NetworkError.swift
//  NetworkModule
//
//  Created by Baher Tamer on 27/08/2026.
//

public enum NetworkError: Error {
    /// The endpoint could not be turned into a valid `URL`.
    case invalidURL

    /// The device could not reach the network at all.
    case noConnection

    /// The request left the device but failed in transit.
    case transportFailure

    /// The server answered with a status outside `200..<300`.
    case unacceptableStatus(code: Int, body: String)

    /// The payload could not be decoded into the expected shape.
    case invalidData
}
