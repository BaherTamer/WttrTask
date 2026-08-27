//
//  String+Casting.swift
//  CoreModule
//
//  Created by Baher Tamer on 27/08/2026.
//

extension String {
    public var asInt: Int {
        Int(self) ?? 0
    }
}
