// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "jmbtestgen",
    products: [
        .library(name: "jmbtestgen", targets: ["jmbtestgen"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "jmbtestgen"
        ),
        .target(
            name: "cmdline",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "jmbtestgen"
            ]
        ),
        .testTarget(
            name: "jmbtestgenTests",
            dependencies: ["jmbtestgen"]),
    ]
)
