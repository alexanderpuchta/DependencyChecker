//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Factory
import XCTest
@testable import Core

final class PackageCheckerTests: XCTestCase {
    
    var shellMock: ShellHelperMock!
    var sut: PackageCheckerRepresentable!
    
    override func setUp() {
        super.setUp()
        
        self.shellMock = ShellHelperMock()
        
        Container.shared.shellHelper.register {
            self.shellMock
        }
        
        self.sut = PackageChecker()
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.sut = nil
    }
}

extension PackageCheckerTests {
    
    func testCheckPackageMajorUpdate() throws {
        // given
        self.shellMock.prepare(.git(.majorMock))
        
        // when
        let result = try self.sut.check(package: .mock)
        
        // then
        XCTAssertEqual(result, .majorMock)
    }
    
    func testCheckPackageMinorUpdate() throws {
        // given
        self.shellMock.prepare(.git(.minorMock))
        
        // when
        let result = try self.sut.check(package: .mock)
        
        // then
        XCTAssertEqual(result, .minorMock)
    }
    
    func testCheckPackagePatchUpdate() throws {
        // given
        self.shellMock.prepare(.git(.patchMock))
        
        // when
        let result = try self.sut.check(package: .mock)
        
        // then
        XCTAssertEqual(result, .patchMock)
    }
}
