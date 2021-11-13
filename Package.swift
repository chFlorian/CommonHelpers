// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonHelpers",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CommonHelpers",
            targets: ["CommonHelpers"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CommonHelpers",
            dependencies: []),
    ]
)
