// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WttrWeather",
    platforms: [
        .iOS(.v27)
    ],
    products: [
        .library(name: "WttrWeather", targets: ["WttrWeather"]),
    ],
    dependencies: [
        // Local
        .package(
            name: "WttrShared",
            path: "../WttrShared"
        ),
        .package(
            name: "NetworkModule",
            path: "../../Packages/NetworkModule"
        ),
        .package(
            name: "CoreModule",
            path: "../../Packages/CoreModule"
        ),
        // Remote
        .package(
            url: "https://github.com/hmlongco/Factory",
            .upToNextMajor(from: "3.3.2")
        )
    ],
    targets: [
        .target(
            name: "WttrWeather",
            dependencies: [
                // Local
                .byName(name: "WttrShared"),
                .byName(name: "NetworkModule"),
                .byName(name: "CoreModule"),
                // Remote
                .product(name: "FactoryKit", package: "Factory")
            ],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
