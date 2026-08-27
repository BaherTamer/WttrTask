//
//  Data+Decode.swift
//  CoreModule
//
//  Created by Baher Tamer on 27/08/2026.
//

import Foundation

extension Data {
    public func decode<T: Decodable>(_ type: T.Type) throws -> T {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(T.self, from: self)
    }
}
