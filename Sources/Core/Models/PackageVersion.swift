//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

struct PackageVersion {
    let value: String
}


// MARK: - PackageVersion + Numbers

extension PackageVersion {
    
    var major: Int {
        self.value.major
    }
    
    var minor: Int {
        self.value.minor
    }
    
    var patch: Int {
        self.value.patch
    }
}


// MARK: - String + Helper

private extension String {
    
    var components: [Int] {
        self.components(separatedBy: ".")
            .compactMap { Int($0) }
    }
    
    var major: Int {
        self.components.first ?? .zero
    }
    
    var minor: Int {
        self.components.dropFirst().first ?? .zero
    }
    
    var patch: Int {
        self.components.last ?? .zero
    }
}
