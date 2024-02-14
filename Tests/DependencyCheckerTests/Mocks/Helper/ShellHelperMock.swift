//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation
@testable import Core

final class ShellHelperMock {
    
    private var response: ShellResponse?
    
    func prepare(_ response: ShellResponse) {
        self.response = response
    }
}


// MARK: - ShellHelperRepresentable

extension ShellHelperMock: ShellHelperRepresentable {
    
    func execute(_ command: ShellCommand) throws -> ShellResponse {
        switch command {
        case let .git(cmd):
            switch cmd {
            case .checkTag:
                guard let response else {
                    throw PackageCheckerError.invalidCommand
                }
                
                return response
            }
            
        case .xcode:
            throw PackageCheckerError.invalidCommand
        }
    }
}
