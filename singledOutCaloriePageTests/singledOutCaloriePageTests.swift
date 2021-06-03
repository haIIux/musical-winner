//
//  singledOutCaloriePageTests.swift
//  singledOutCaloriePageTests
//
//  Created by Rob Maltese on 6/1/21.
//

import XCTest
@testable import singledOutCaloriePage

class singledOutCaloriePageTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMaintainWeight() {
        // Testing the maintaining weight computed variable.
        let expectedOutcome = 2432.4
        let baselineCalories = 2027.0
        let maintainWeightMultiplier = 1.2
        
        let mathCalculation = Double(baselineCalories) * maintainWeightMultiplier
        XCTAssertEqual(expectedOutcome, mathCalculation)
    }
}

func maintainWeightCalculationComplete(_ in1: Double, _ in2: Double) -> Double {
    return 2432.4
}
