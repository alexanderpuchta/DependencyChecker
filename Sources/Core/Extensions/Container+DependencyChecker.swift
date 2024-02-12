//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Factory
import Foundation

extension Container {
    
    var gitTagHelper: Factory<GitTagHelperRepresentable> {
        Factory(self) {
            GitTagHelper()
        }
    }
    
    var packageChecker: Factory<PackageCheckerRepresentable> {
        Factory(self) {
            PackageChecker()
        }
    }
    
    var shellHelper: Factory<ShellHelperRepresentable> {
        Factory(self) {
            ShellHelper()
        }
    }
}
