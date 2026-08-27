//
//  Resolver.swift
//  CoreModule
//
//  Created by Baher Tamer on 27/08/2026.
//

import FactoryKit

public enum Resolver {
    @inline(__always)
    public static func resolve<T>(
        _ keyPath: KeyPath<Container, Factory<T>>,
        container: Container = Container.shared
    ) -> T {
        container[keyPath: keyPath]()
    }
    
    @inline(__always)
    public static func resolve<A, T>(
        _ keyPath: KeyPath<Container, ParameterFactory<A, T>>,
        _ arg: A,
        container: Container = Container.shared
    ) -> T {
        container[keyPath: keyPath](arg)
    }
}
