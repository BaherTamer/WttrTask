//
//  Domainable.swift
//  CoreModule
//
//  Created by Baher Tamer on 27/08/2026.
//

public protocol Domainable: Decodable {
    associatedtype Domain
    func toDomain() -> Domain
}
