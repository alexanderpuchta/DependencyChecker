//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Factory
import Foundation
import ShellOut

enum ShellResponse {
    case git(PackageVersion)
}

protocol ShellHelperRepresentable {
    func execute(_ command: ShellCommand) throws -> ShellResponse
}


// MARK: - ShellHelper

struct ShellHelper {
    
    @Injected(\.gitTagHelper)
    private var gitTagHelper
}


// MARK: - ShellHelperRepresentable

extension ShellHelper: ShellHelperRepresentable {
    
    func execute(_ command: ShellCommand) throws -> ShellResponse {
        switch command {
        case let .git(gitCommand):
            let tag = try handleGitCommand(gitCommand)
            return .git(tag)
        }
    }
}


// MARK: - Helper

private extension ShellHelper {
    
    func handleGitCommand(_ cmd: GitCommand) throws -> PackageVersion {
        
        let response = try shellOut(
            to: cmd.shellPath,
            arguments: cmd.arguments
        )
        
        return try gitTagHelper.latest(response)
    }
}


// MARK: - GitCommand + Values

private extension GitCommand {
    
    var arguments: [String] {
        switch self {
        case let .checkTag(url):
            [
                "ls-remote",
                "--tags",
                url.absoluteString
            ]
        }
    }
    
    var shellPath: String {
        "git"
    }
}
