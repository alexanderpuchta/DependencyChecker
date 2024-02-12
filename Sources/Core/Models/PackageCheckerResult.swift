//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

struct PackageCheckerResult {
    let level: Level
    let package: SwiftPackage
    let version: PackageVersion
}


// MARK: - PackageCheckerResult + Message

extension PackageCheckerResult {
    var message: String {
        [
            "package '\(self.package.name)'",
            "got a new \(self.level.name) update.",
            "version '\(self.version.value)' is available."
        ]
        .joined(separator: " ")
    }
}

// MARK: - PackageCheckerResult + Level

extension PackageCheckerResult {
    
    enum Level {
        case major
        case minor
        case none
        case patch
    }
}


private extension PackageCheckerResult.Level {
    
    var name: String {
        "\(self)".uppercased()
    }
}
