//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Factory
import Foundation
import ShellOut

enum ShellResponse {
    case git(PackageVersion)
    case xcode
}

protocol ShellHelperRepresentable {
    func execute(_ command: ShellCommand) throws -> ShellResponse
}


// MARK: - ShellHelper

struct ShellHelper {
    
    @Injected(\.gitTagHelper)
    private var gitTagHelper
    
    @Injected(\.projectHelper)
    private var projectHelper
}


// MARK: - ShellHelperRepresentable

extension ShellHelper: ShellHelperRepresentable {
    
    func execute(_ command: ShellCommand) throws -> ShellResponse {
        switch command {
        case let .git(gitCommand):
            let tag = try self.handleGitCommand(gitCommand)
            return .git(tag)
            
        case .xcode:
            _ = try self.handleXcodeCommand()
            return .xcode
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
        
        return try self.gitTagHelper.latest(response)
    }
    
    func handleXcodeCommand() throws {
        
        let projectPath = try shellOut(
            to: [
                Constants.pwd
            ]
        )
        
        let folders = try self.projectHelper.parse(projectPath)
        try folders.forEach { try $0.delete() }
        
        try shellOut(to: Constants.xcodePackageCmd)
        
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


// MARK: - Constants

private extension Constants {
    
    static let pwd = "pwd"
    static let xcodePackageCmd = "xcodebuild -resolvePackageDependencies"
}
