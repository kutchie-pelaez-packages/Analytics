// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "Analytics",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(
            name: "AnalyticsTrackerImpl",
            targets: [
                 "AnalyticsTrackerImpl"
            ]
        ),
        .library(
            name: "Analytics",
            targets: [
                "Analytics"
            ]
        )
    ],
    dependencies: [
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core.git", .branch("master")),
        .package(name: "Logging", url: "https://github.com/kutchie-pelaez-packages/Logging.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "AnalyticsTrackerImpl",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "Logger", package: "Logging"),
                .target(name: "Analytics")
            ]
        ),
        .target(
            name: "Analytics",
            dependencies: [
                .product(name: "Core", package: "Core")
            ]
        )
    ]
)
