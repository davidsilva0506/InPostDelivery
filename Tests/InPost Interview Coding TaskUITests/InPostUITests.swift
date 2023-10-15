//
//  InPostUITests.swift
//  InPost Interview Coding TaskUITests
//
//  Created by David Silva on 14/10/2023.
//

import XCTest

class InPostUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        
        super.setUp()

        continueAfterFailure = false
        self.app.launchArguments.append(AppConstants.automationLaunchArgument)
        XCUIApplication().launch()
    }

    override func tearDown() {
        
        super.tearDown()
    }

    func testListViewTitle() {

        let listTitle = app.staticTexts["Lista przesyłek"]

        XCTAssert(listTitle.exists)
    }
    
    func testTableView() {
        
        let cells = app.tables.cells
        let count = cells.count
        
        XCTAssert(count > 0)
    }
    
    func testTableViewHeaders() {
        
        let tables = app.tables
        let headerTitle = tables.staticTexts["Gotowe do odbioru"]
        let header2Title = tables.staticTexts["Pozostale"]
        
        XCTAssert(headerTitle.exists)
        XCTAssert(header2Title.exists)
    }
    
    func testCell() {
        
        let cells = app.tables.cells
        let firstCell = cells.element(boundBy: 0)
        
        let packInfoTitle = firstCell.staticTexts["NR PRZESYŁKI"]
        let packStatusTitle = firstCell.staticTexts["STATUS"]
        let packSenderTitle = firstCell.staticTexts["NADAWCA"]
        let viewMore = firstCell.staticTexts["więcej"]
        let packImage = firstCell.images["PackImage"]
        let arrow = firstCell.images["Arrow"]
        
        XCTAssert(packInfoTitle.exists)
        XCTAssert(packStatusTitle.exists)
        XCTAssert(packSenderTitle.exists)
        XCTAssert(viewMore.exists)
        XCTAssert(packImage.exists)
        XCTAssert(arrow.exists)
    }
    
    func testArchive() {

        let cells = app.tables.cells
        cells.element(boundBy: 0).swipeLeft()
        cells.element(boundBy: 0).buttons["Archive"].tap()
    }
}
