//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Factory
import Foundation

extension Container {
    
    var configurationHelper: Factory<ConfigurationHelperRepresentable> {
        Factory(self) {
            ConfigurationHelper()
        }
    }
    
    var derivedDataHelper: Factory<DerivedDataHelperRepresentable> {
        Factory(self) {
            DerivedDataHelper()
        }
    }
    
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
    
    var projectHelper: Factory<ProjectHelperRepresentable> {
        Factory(self) {
            ProjectHelper()
        }
    }
    
    var resolvedPackages: Factory<ResolvedPackagesHelperRepresentable> {
        Factory(self) {
            ResolvedPackagesHelper()
        }
    }
    
    var shellHelper: Factory<ShellHelperRepresentable> {
        Factory(self) {
            ShellHelper()
        }
    }
}
