//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

struct Configuration {
    
    let levels: [PackageCheckerResult.Level]
    let locations: [PackageLocationType]
    let versions: [PackageFileVersion]
    
    
    // MARK: - Init
    
    public init(
        levels: [DependencyMessage],
        locations: [DependencyLocation],
        versions: [DependencyVersion]
    ) {
        self.levels = levels.map(\.type)
        self.locations = locations.map(\.type)
        self.versions = versions.map(\.type)
    }
}


// MARK: - DependencyLocation + Type

private extension DependencyLocation {
    
    var type: PackageLocationType {
        switch self {
        case .invisible:
                .package(type: .invisible)
            
        case .shared:
                .shared
            
        case .visible:
                .package(type: .visible)
            
        case .workspace:
                .workspace
        }
    }
}


// MARK: - DependencyMessage + Type

private extension DependencyMessage {
    
    var type: PackageCheckerResult.Level {
        switch self {
        case .major:
                .major
            
        case .minor:
                .minor
            
        case .patch:
                .patch
        }
    }
}


// MARK: - DependencyVersion + Type

private extension DependencyVersion {
    
    var type: PackageFileVersion {
        switch self {
        case .v1:
                .v1
            
        case .v2:
                .v2
        }
    }
}
