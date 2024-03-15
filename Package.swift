// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreRecord",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CoreRecord",
            targets: ["CoreRecord"]
        ),
        .library(
            name: "CoreRecordCore",
            targets: ["CoreRecordCore"]
        ),
        .library(
            name: "CoreRecordCombine",
            targets: ["CoreRecordCombine"]
        ),
        .library(
            name: "CoreRecordMigration",
            targets: ["CoreRecordMigration"]
        ),
        .library(
            name: "CoreRecordX",
            targets: ["CoreRecordX"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CoreRecord",
            dependencies: ["CoreRecordCore", "CoreRecordCombine", "CoreRecordMigration", "CoreRecordX"],
            path: "CoreRecord"
        ),
        .target(
            name: "CoreRecordCore",
            dependencies: [],
            path: "Core"
        ),
        .target(
            name: "CoreRecordCombine",
            dependencies: ["CoreRecordCore"],
            path: "CoreRecord+Combine"
        ),
        .target(
            name: "CoreRecordMigration",
            dependencies: ["CoreRecordCore"],
            path: "CoreRecord+Migration"
        ),
        .target(
            name: "CoreRecordX",
            dependencies: ["CoreRecordCore"],
            path: "CoreRecord+X"
        ),
    ]
)
