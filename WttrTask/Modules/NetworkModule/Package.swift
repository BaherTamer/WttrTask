// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkModule",
    platforms: [
        .iOS(.v27)
    ],
    products: [
        .library(name: "NetworkModule", targets: ["NetworkModule"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/hmlongco/Factory",
            .upToNextMajor(from: "3.3.2")
        )
    ],
    targets: [
        .target(
            name: "NetworkModule",
            dependencies: [
                .product(name: "FactoryKit", package: "Factory")
            ],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
