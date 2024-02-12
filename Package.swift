// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DependencyChecker",
    platforms: [
        .macOS(.v10_14)
    ],
    dependencies: [
        .package(
            url: "https://github.com/hmlongco/Factory.git",
            .upToNextMajor(from: "2.3.1")
        ),
        .package(
            url: "https://github.com/JohnSundell/ShellOut.git",
            .upToNextMajor(from: "2.3.0")
        )
    ],
    targets: [
        .executableTarget(
            name: "DependencyChecker",
            dependencies: [
                .product(
                    name: "Factory",
                    package: "Factory"
                ),
                .product(
                    name: "ShellOut",
                    package: "ShellOut"
                )
            ]
        )
    ]
)
