//
//  InPost_Interview_Coding_TaskUITestsLaunchTests.swift
//  InPost Interview Coding TaskUITests
//
//  Created by David Silva on 14/10/2023.
//

import XCTest

final class InPost_Interview_Coding_TaskUITestsLaunchTests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }

    func testLaunch() throws {
        
        let app = XCUIApplication()
        app.launchArguments.append(AppConstants.automationLaunchArgument)
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
