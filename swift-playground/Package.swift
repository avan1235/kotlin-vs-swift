// swift-tools-version: 5.8

import PackageDescription

let package = Package(
        name: "swift-playground",
        dependencies: [
            .package(
                    url: "https://github.com/attaswift/BigInt.git",
                    from: "5.3.0"),
        ],
        targets: [
            .executableTarget(
                    name: "swift-playground",
                    dependencies: [
                        .product(name: "BigInt", package: "BigInt"),
                    ],
                    path: "Sources"),
        ]
)
