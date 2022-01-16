// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "AnalyticsTracker",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(name: "AnalyticsTracker", targets: ["AnalyticsTracker"]),
        .library(name: "AnalyticsEvent", targets: ["AnalyticsEvent"])
    ],
    dependencies: [
        .package(name: "CoreUtils", url: "https://github.com/kutchie-pelaez-packages/CoreUtils", .branch("master"))
    ],
    targets: [
        .target(
            name: "AnalyticsTracker",
            dependencies: [
                .product(name: "CoreUtils", package: "CoreUtils"),
                .target(name: "AnalyticsEvent")
            ]
        ),
        .target(name: "AnalyticsEvent")
    ]
)
