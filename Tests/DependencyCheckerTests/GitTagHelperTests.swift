//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import XCTest
@testable import Core

final class GitTagHelperTests: XCTestCase {
    
    var sut: GitTagHelperRepresentable!
    
    override func setUp() {
        super.setUp()
        
        self.sut = GitTagHelper()
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.sut = nil
    }
}

extension GitTagHelperTests {
    
    func testLatestIsMajor() throws {
        // given
        
        // when
        let result = try self.sut.latest(.gitLsMockWithVersion(.versionMajorMock))
        
        // then
        XCTAssertEqual(result, .majorMock)
    }
    
    func testLatestIsMinor() throws {
        // given
        
        // when
        let result = try self.sut.latest(.gitLsMockWithVersion(.versionMinorMock))
        
        // then
        XCTAssertEqual(result, .minorMock)
    }
    
    func testLatestIsNone() throws {
        // given
        
        // when
        let result = try self.sut.latest(.gitLsMockWithVersion(.versionDefaultMock))
        
        // then
        XCTAssertEqual(result, .mock)
    }
    
    func testLatestIsPatch() throws {
        // given
        
        // when
        let result = try self.sut.latest(.gitLsMockWithVersion(.versionPatchMock))
        
        // then
        XCTAssertEqual(result, .patchMock)
    }
}
