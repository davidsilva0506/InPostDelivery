//
//  ArraySafeTests.swift
//  InPost Interview Coding TaskTests
//
//  Created by David Silva on 15/10/2023.
//

import XCTest

final class ArraySafeTests: XCTestCase {
 
    func testSafeAccess() {

        let array = [1,2,3,4,5]
        
        let value = array[safe: 2]
        let value2 = array[safe: 10]
        
        XCTAssertNotNil(value)
        XCTAssertNil(value2)
        XCTAssertEqual(value, 3)
    }
}
