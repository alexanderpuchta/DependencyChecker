//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

protocol GitTagHelperRepresentable {
    func latest(_ input: String) throws -> PackageVersion
}


// MARK: - GitTagHelper

struct GitTagHelper {}


// MARK: - GitTagError

enum GitTagError: Error {
    case notAvailable
}


// MARK: - GitTagHelperRepresentable

extension GitTagHelper: GitTagHelperRepresentable {
    
    func latest(_ input: String) throws -> PackageVersion {
        
        guard let tag = input.rows
            .map(\.ref)
            .compactMap(\.tag)
            .map(PackageVersion.init(value:))
            .sorted(by: { lhsTag, rhsTag in
                lhsTag.value.compare(rhsTag.value, options: .numeric) == .orderedDescending
            })
            .first
        else {
            throw GitTagError.notAvailable
        }
        
        return tag
    }
}


// MARK: - String + Helper

private extension String {
    
    var ref: String {
        self
            .components(separatedBy: "\t")
            .dropFirst()
            .joined()
    }
    
    var rows: [String] {
        self
            .components(separatedBy: "\n")
    }
    
    var tag: String? {
        self
            .components(separatedBy: "/")
            .last
    }
}
