//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Factory
import Foundation

protocol PackageCheckerRepresentable {
    func check(package: SwiftPackage) throws -> PackageCheckerResult
}


// MARK: - PackageChecker

struct PackageChecker {
    
    @Injected(\.shellHelper)
    private var shellHelper
}


// MARK: - PackageCheckerError

enum PackageCheckerError: Error {
    case invalidCommand
}


// MARK: - PackageCheckerRepresentable

extension PackageChecker: PackageCheckerRepresentable {
    
    func check(package: SwiftPackage) throws -> PackageCheckerResult {
        
        let response = try shellHelper.execute(.git(.checkTag(repository: package.url)))
        
        switch response {
        case let .git(version):
            return PackageCheckerResult(
                level: package.current.compare(with: version),
                package: package,
                version: version
            )
        }
    }
}


// MARK: - PackageVersion + Result

private extension PackageVersion {
    
    func compare(with version: PackageVersion) -> PackageCheckerResult.Level {
        
        if self.isMajorUpdate(version.major) {
            return .major
        }
        
        if self.isMinorUpdate(version.minor) {
            return .minor
        }
        
        if self.isPatchUpdate(version.patch) {
            return .patch
        }
            
        return .none
    }
    
    func isMajorUpdate(_ major: Int) -> Bool {
        self.major < major
    }
    
    func isMinorUpdate(_ minor: Int) -> Bool {
        self.minor < minor
    }
    
    func isPatchUpdate(_ patch: Int) -> Bool {
        self.patch < patch
    }
}
