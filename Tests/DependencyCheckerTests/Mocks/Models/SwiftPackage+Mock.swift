//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation
@testable import Core

extension SwiftPackage {
    
    static let mock = SwiftPackage(
        current: .mock,
        name: .packageNameMock,
        url: .repositoryMock
    )
}


// MARK: - Equatable

extension SwiftPackage: Equatable {
    
    public static func == (lhs: SwiftPackage, rhs: SwiftPackage) -> Bool {
        lhs.current == rhs.current &&
        lhs.name == rhs.name &&
        lhs.url == rhs.url
    }
}
