//
//  _5testing_CalculatorUITests.swift
//  05testing_CalculatorUITests
//
//  Created by Benedikt Langer on 03.06.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import XCTest

class _5testing_CalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
        
        let button = app.buttons["2"]
        button.tap()
        
        let button2 = app.buttons["6"]
        button2.tap()
        
        let button3 = app.buttons["+"]
        button3.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["6"]/*[[".buttons[\"6\"].staticTexts[\"6\"]",".staticTexts[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let staticText = app/*@START_MENU_TOKEN@*/.staticTexts["="]/*[[".buttons[\"=\"].staticTexts[\"=\"]",".staticTexts[\"=\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        staticText.tap()
        app.buttons["+/-"].tap()
        button3.tap()
        
        let button4 = app.buttons["3"]
        button4.tap()
        
        let button5 = app.buttons["="]
        button5.tap()
        
        let button6 = app.buttons["9"]
        button6.tap()
        button2.tap()
        
        let button7 = app.buttons["5"]
        button7.tap()
        app.buttons["-"].tap()
        button6.tap()
        app.buttons["x"].tap()
        button.tap()
        staticText.tap()
        app.buttons["0"].tap()
        
        
        
        
       
        app.buttons["9"]
        button.tap()
        
        app.buttons["6"]
        button2.tap()
        
        app.buttons["5"]
        button3.tap()
        app.buttons["4"].tap()
        
        app.buttons["8"]
        button4.tap()
        button4.tap()
        button4.tap()
        button4.tap()
        button.tap()
        app.buttons["x"].tap()
        button.tap()
        button2.tap()
        button.tap()
        
        app.buttons["="]
        button5.tap()
        app.buttons["+"].tap()
        button3.tap()
        button5.tap()
        app.buttons["÷"].tap()
        button4.tap()
        app.buttons["7"].tap()
        button.tap()
        button5.tap()
        
        
        XCUIApplication()
        app.buttons["1"]
        button.tap()
        
         app.buttons["0"]
        button2.tap()
        app.buttons["2"].tap()
        app.buttons["5"].tap()
        
        app.buttons["6"]
        button3.tap()
        
        app.buttons["÷"]
        button4.tap()
        button.tap()
        button2.tap()
        button2.tap()
        button2.tap()
        
        app.buttons["="]
        button5.tap()
        
        app.buttons["-"]
        button6.tap()
        button3.tap()
        
        app.buttons["9"]
        button7.tap()
        
        let xButton = app.buttons["x"]
        xButton.tap()
        app.buttons["8"].tap()
        button6.tap()
        button7.tap()
        
        xButton.tap()
        button4.tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        button5.tap()
        
       
        
        app.buttons["9"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["%"]/*[[".buttons[\"%\"].staticTexts[\"%\"]",".staticTexts[\"%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["8"]/*[[".buttons[\"8\"].staticTexts[\"8\"]",".staticTexts[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["="].tap()
        
        
        
        
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
