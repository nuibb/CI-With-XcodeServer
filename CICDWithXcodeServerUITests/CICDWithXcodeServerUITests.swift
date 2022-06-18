//
//  CICDWithXcodeServerUITests.swift
//  CICDWithXcodeServerUITests
//
//  Created by ReliSource Technologies Ltd. on 6/18/22.
//

import XCTest

class CICDWithXcodeServerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testWeHaveABananaCell() throws {
        let app = XCUIApplication()
        app.launch()

        let cells = app.cells.allElementsBoundByIndex
        let row = cells.filter { $0.label.contains("🍌" ) }
        XCTAssertNotNil(row)
    }

    func testWeHaveACherryCell() throws {
        let app = XCUIApplication()
        app.launch()

        let cells = app.cells.allElementsBoundByIndex
        let row = cells.filter { $0.label.contains("🍒" ) }
        XCTAssertFalse(row.isEmpty)
    }
}
