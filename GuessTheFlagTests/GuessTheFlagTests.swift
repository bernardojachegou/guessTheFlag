//
//  GuessTheFlagTests.swift
//  GuessTheFlagTests
//
//  Created by Michel Bernardo on 19/04/21.
//

import XCTest
@testable import GuessTheFlag

class GuessTheFlagTests: XCTestCase {
    
    private var finalScoreValues: FinalScoreValues
    
    private let viewModel: ResultBoardViewModel

    override func setUpWithError() throws {
        viewModel.setScore(0)
    }

    override func tearDownWithError() throws {
        viewModel.setScore(0)
    }

    func testLowScoreLimit() throws {
        viewModel.setScore(-20)
        XCTAssertEqual(Int(viewModel.getScore()), 0)
    }
    
    func testResultFinalMessage() throws {
        XCTAssertEqual(viewModel.getFinalMessage(), .bad)
        viewModel.setScore(6)
        XCTAssertEqual(viewModel.getFinalMessage(), .good)
        viewModel.setScore(9)
        XCTAssertEqual(viewModel.getFinalMessage(), .best)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
