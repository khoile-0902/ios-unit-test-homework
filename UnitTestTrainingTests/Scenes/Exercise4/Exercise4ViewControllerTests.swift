//
//  Exercise4ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by KhoiLe on 02/09/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise4ViewControllerTests: XCTestCase {
    var viewController: Exercise4ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise4ViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.dateBackgroundView)
        XCTAssertNotNil(viewController.dateLabel)
        XCTAssertNotNil(viewController.datePicker)
    }
}
