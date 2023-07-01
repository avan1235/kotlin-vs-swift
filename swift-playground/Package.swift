// swift-tools-version: 5.8

import PackageDescription

let package = Package(
        name: "swift-playground",
        dependencies: [
            .package(
                    url: "https://github.com/vapor/vapor.git",
                    branch: "main"),
        ],
        targets: [
            .executableTarget(
                    name: "swift-playground",
                    dependencies: [
                        .product(name: "Vapor", package: "vapor"),
                    ],
                    path: "Sources"),
        ]
)
