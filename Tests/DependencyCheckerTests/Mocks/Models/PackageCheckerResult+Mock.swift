//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation
@testable import Core

extension PackageCheckerResult {
    
    static let mock = PackageCheckerResult(
        level: .major,
        package: .mock,
        version: .mock
    )
    
    static let majorMock = PackageCheckerResult(
        level: .major,
        package: .mock,
        version: .majorMock
    )
    
    static let minorMock = PackageCheckerResult(
        level: .minor,
        package: .mock,
        version: .minorMock
    )
    
    static let patchMock = PackageCheckerResult(
        level: .patch,
        package: .mock,
        version: .patchMock
    )
}


// MARK: - Equatable

extension PackageCheckerResult: Equatable {
    
    public static func == (lhs: PackageCheckerResult, rhs: PackageCheckerResult) -> Bool {
        lhs.level == rhs.level &&
        lhs.package == rhs.package &&
        lhs.version == rhs.version
    }
}
