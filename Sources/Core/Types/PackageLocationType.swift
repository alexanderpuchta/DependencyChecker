//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

public enum PackageLocationType {
    
    case package(type: FileType)
    case shared
    case workspace
}


// MARK: - PackageLocationType + Path

extension PackageLocationType {
    
    var path: String {
        switch self {
        case .package:
            self.fileName
            
        case .shared,
             .workspace:
            [
                self.components
                    .map(\.pathName)
                    .joined(separator: "/"),
                self.fileName
            ]
            .joined(separator: "/")
        }
    }
}


// MARK: - Helper

private extension PackageLocationType {
    
    var components: [PathComponent] {
        switch self {
        case .package:
            []
            
        case .shared:
            [
                .shared,
                .spm
            ]
            
        case .workspace:
            [
                .workspace,
                .shared,
                .spm
            ]
        }
    }
    
    var fileName: String {
        let file = switch self {
        case let .package(type):
            type.fileName
            
        case .shared,
             .workspace:
            FileType.visible.fileName
        }
        
        return [
            file,
            Constants.resolved
        ]
        .joined(separator: ".")
    }
}


// MARK: - FileType + FileName

private extension FileType {
    
    var fileName: String {
        switch self {
        case .invisible:
            ".package"
            
        case .visible:
            "Package"
        }
    }
}


// MARK: - PathComponent + Name

private extension PathComponent {
    
    var pathName: String {
        switch self {
        case .shared:
            Constants.xcshareddata
            
        case .spm:
            Constants.spm
            
        case .workspace:
            [
                Constants.project,
                Constants.workspace
            ]
            .joined(separator: ".")
        }
    }
}
