//
//  Anupong_Dorkkum_AssignmentUITestsLaunchTests.swift
//  Anupong-Dorkkum-AssignmentUITests
//
//  Created by gone on 20/7/2567 BE.
//

import XCTest

final class Anupong_Dorkkum_AssignmentUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
