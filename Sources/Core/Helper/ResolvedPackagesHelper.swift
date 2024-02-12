//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Files
import Foundation

protocol ResolvedPackagesHelperRepresentable {
    func find(at locations: [PackageLocationType]) throws -> [SwiftPackage]
}


// MARK: - ResolvedPackagesHelper

struct ResolvedPackagesHelper {
    
    let decoder: JSONDecoder
    
    
    // MARK: - Init
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
}


// MARK: - ResolvedPackagesError

enum ResolvedPackagesError: Error {
    case noPackages
    case noProject
    case noWorkspace
}


// MARK: - ResolvedPackagesHelperRepresentable

extension ResolvedPackagesHelper: ResolvedPackagesHelperRepresentable {
    
    func find(at locations: [PackageLocationType]) throws -> [SwiftPackage] {
        
        let packagesResolvedFile = try self.findPackages(at: locations)
        let packages = try self.map(packagesResolved: packagesResolvedFile)
        
        return packages.map { resolved in
            SwiftPackage(
                current: resolved.version,
                name: resolved.identity,
                url: resolved.url
            )
        }
    }
}


// MARK: - Helper

private extension ResolvedPackagesHelper {
    
    func findPackages(at locations: [PackageLocationType]) throws -> File {
        
        guard let project = Folder.current.subfolders.filter({ $0.name.hasSuffix(Constants.xcodeProject) }).first else {
            throw ResolvedPackagesError.noProject
        }
        
        guard let workspace = project.subfolders.filter({ $0.name.hasSuffix(Constants.workspace) }).first else {
            throw ResolvedPackagesError.noWorkspace
        }
        
        guard let packages = locations.map(\.path).compactMap({ path in
            try? workspace.file(at: path)
        }).first else {
            throw ResolvedPackagesError.noPackages
        }
        
        return packages
    }
    
    func map(packagesResolved file: File) throws -> [ResolvedPackage] {
        
        let data = try file.read()
        let resolvedFile = try decoder.decode(ResolvedFile.self, from: data)
        
        return resolvedFile.packages
    }
}
