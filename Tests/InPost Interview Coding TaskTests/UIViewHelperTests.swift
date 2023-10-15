//
//  UIViewHelperTests.swift
//  InPost Interview Coding TaskTests
//
//  Created by David Silva on 15/10/2023.
//

import XCTest

final class UIViewHelperTests: XCTestCase {
 
    func testMultipleAddAndRemoveAll() {
        
        let parentView = UIView()
        let subView = UIView()
        let subView2 = UIView()
        let subView3 = UIView()
        
        parentView.add(subView, subView2)
        
        XCTAssertEqual(parentView.subviews.count, 2)
        
        parentView.add(subView3)
        
        XCTAssertEqual(parentView.subviews.count, 3)
        
        parentView.removeAllSubviews()
        
        XCTAssertEqual(parentView.subviews.count, 0)
    }
}
