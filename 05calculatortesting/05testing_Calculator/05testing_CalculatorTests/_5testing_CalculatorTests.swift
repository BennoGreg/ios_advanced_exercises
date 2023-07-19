//
//  _5testing_CalculatorTests.swift
//  05testing_CalculatorTests
//
//  Created by Benedikt Langer on 03.06.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import XCTest
@testable import _5testing_Calculator

class _5testing_CalculatorTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSimpleCalc() throws{
        
        // SimpleCalculation
        let calc = Calculator()
        XCTAssert(calc.prevOperator == .enter)
        calc.doMath(button: .plus, curNumber: 5, completion: nil)
        XCTAssertEqual(calc.prevNumber, 5.0)
        XCTAssertEqual(calc.prevOperator, .plus)
        calc.doMath(button: .enter, curNumber: 10) { (result) in
            XCTAssertEqual(result, 15)
        }
        XCTAssertEqual(calc.prevNumber, 15)
        XCTAssertEqual(calc.prevOperator, .enter)
        
        calc.doMath(button: .minus, curNumber: 5, completion: nil)
        calc.doMath(button: .enter, curNumber: 3) { (result) in
            XCTAssertEqual(result, 2)
        }
        
        calc.doMath(button: .multiply, curNumber: 5, completion: nil)
        calc.doMath(button: .enter, curNumber: 3) { (result) in
            XCTAssertEqual(result, 15)
        }
        
        calc.doMath(button: .divide, curNumber: 5, completion: nil)
        calc.doMath(button: .enter, curNumber: 2) { (result) in
            XCTAssertEqual(result, 2.5)
        }
        
        calc.doMath(button: .minus, curNumber: 5, completion: nil)
        calc.doMath(button: .enter, curNumber: 10) { (result) in
            XCTAssertEqual(result, -5)
        }
        
        calc.doMath(button: .modulo, curNumber: 10, completion: nil)
        calc.doMath(button: .enter, curNumber: 8) { (result) in
            XCTAssertEqual(result, 2)
        }
        
    }
    
    func testChainCalc() throws{
        let calc = Calculator()
        
        // Simple chained plus/minus calculations
        calc.doMath(button: .plus, curNumber: 5, completion: nil)
        calc.doMath(button: .plus, curNumber: 10){ (result) in
            XCTAssertEqual(result, 15)
        }
        calc.doMath(button: .minus, curNumber: 10) { (result) in
            XCTAssertEqual(result, 25)
        }
        calc.doMath(button: .enter, curNumber: 10) { (result) in
            XCTAssertEqual(result, 15)
        }
        
        // Simple chained multiply/divide calculations
        calc.doMath(button: .multiply, curNumber: 5, completion: nil)
        calc.doMath(button: .multiply, curNumber: 5) { (result) in
            XCTAssertEqual(result, 25)
        }
        calc.doMath(button: .divide, curNumber: 0.2) { (result) in
            XCTAssertEqual(result, 5)
        }
        calc.doMath(button: .divide, curNumber: 5) { (result) in
            XCTAssertEqual(result, 1)
        }
        calc.doMath(button: .enter, curNumber: 5) { (result) in
            XCTAssertEqual(result, 0.2)
        }
        
        // Combined 10+5*2*2 = 30
        calc.doMath(button: .plus, curNumber: 10, completion: nil)
        calc.doMath(button: .multiply, curNumber: 5) { (result) in
            XCTAssertEqual(result, 5)
        }
        XCTAssertEqual(calc.prevNumber, 5)
        XCTAssertEqual(calc.tempForDotCalc, 10)
        XCTAssertEqual(calc.prevPrevOperator, .plus)
        calc.doMath(button: .multiply, curNumber: 2) { (result) in
            XCTAssertEqual(result, 10)
        }
        calc.doMath(button: .enter, curNumber: 2) { (result) in
            XCTAssertEqual(result, 30)
        }
        
        // 10 - 5*2*2
        calc.doMath(button: .minus, curNumber: 10, completion: nil)
        calc.doMath(button: .multiply, curNumber: 5) { (result) in
            XCTAssertEqual(result, 5)
        }
        calc.doMath(button: .multiply, curNumber: 2) { (result) in
            XCTAssertEqual(result, 10)
        }
        calc.doMath(button: .enter, curNumber: 2) { (result) in
            XCTAssertEqual(result, -10)
        }
        
        // 10 + 5/2/2 = 11.25
        calc.doMath(button: .plus, curNumber: 10, completion: nil)
        calc.doMath(button: .divide, curNumber: 5) { (result) in
            XCTAssertEqual(result, 5)
        }
        calc.doMath(button: .divide, curNumber: 2) { (result) in
            XCTAssertEqual(result, 2.5)
        }
        calc.doMath(button: .enter, curNumber: 2) { (result) in
            XCTAssertEqual(result, 11.25)
        }
        
        // 10 - 5/2/2 = 8.75
        calc.doMath(button: .minus, curNumber: 10, completion: nil)
        calc.doMath(button: .divide, curNumber: 5) { (result) in
            XCTAssertEqual(result, 5)
        }
        calc.doMath(button: .divide, curNumber: 2) { (result) in
            XCTAssertEqual(result, 2.5)
        }
        calc.doMath(button: .enter, curNumber: 2) { (result) in
            XCTAssertEqual(result, 8.75)
        }
        
        // 10 + 5 * 2 - 2 / 2 = 19
        calc.doMath(button: .plus, curNumber: 10, completion: nil)
        calc.doMath(button: .multiply, curNumber: 5) { (result) in
            XCTAssertEqual(result, 5)
        }
        calc.doMath(button: .minus, curNumber: 2) { (result) in
            XCTAssertEqual(result, 20)
        }
        calc.doMath(button: .divide, curNumber: 2) { (result) in
            XCTAssertEqual(result, 2)
        }
        calc.doMath(button: .enter, curNumber: 2) { (result) in
            XCTAssertEqual( result, 19)
        }
        
        // 10 + 5 * 2 / 2 - 2 = 19
        calc.doMath(button: .plus, curNumber: 10, completion: nil)
        calc.doMath(button: .multiply, curNumber: 5) { (result) in
            XCTAssertEqual(result, 5)
        }
        calc.doMath(button: .divide, curNumber: 2) { (result) in
            XCTAssertEqual(result, 10)
        }
        calc.doMath(button: .minus, curNumber: 2) { (result) in
            XCTAssertEqual(result, 15)
        }
        calc.doMath(button: .enter, curNumber: 2) { (result) in
            XCTAssertEqual( result, 13)
        }
        
    }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
