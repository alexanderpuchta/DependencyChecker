// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DependencyChecker",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .executable(
            name: "dependency-checker",
            targets: [
                "DependencyCheckerTool"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            from: "1.3.0"
        ),
        .package(
            url: "https://github.com/hmlongco/Factory.git",
            .upToNextMajor(from: "2.3.1")
        ),
        .package(
            url: "https://github.com/johnsundell/Files.git",
            .upToNextMajor(from: "4.2.0")
        ),
        .package(
            url: "https://github.com/JohnSundell/ShellOut.git",
            .upToNextMajor(from: "2.3.0")
        ),
        .package(
            url: "https://github.com/jpsim/Yams.git",
            from: "5.0.6"
        )
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(
                    name: "Factory",
                    package: "Factory"
                ),
                .product(
                    name: "Files",
                    package: "Files"
                ),
                .product(
                    name: "ShellOut",
                    package: "ShellOut"
                ),
                .product(
                    name: "Yams",
                    package: "Yams"
                )
            ]
        ),
        .executableTarget(
            name: "DependencyCheckerTool",
            dependencies: [
                "Core",
                .product(
                    name: "ArgumentParser",
                    package: "swift-argument-parser"
                )
            ]
        ),
        .testTarget(
            name: "DependencyCheckerTests",
            dependencies: [
                "Core"
            ]
        )
    ]
)
