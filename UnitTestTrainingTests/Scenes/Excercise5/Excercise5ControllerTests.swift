//
//  Excercise5ControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by KhoiLe on 04/09/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise5ViewControllerTests: XCTestCase {
    var viewController: Exercise5ViewController!

    override func setUp() {
        super.setUp()
        viewController = Exercise5ViewController.instantiate()
    }

    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.couponView)
        XCTAssertNotNil(viewController.priceTextField)
        XCTAssertNotNil(viewController.receiveMethodSegment)
        XCTAssertNotNil(viewController.usingCouponSwitch)
        XCTAssertNotNil(viewController.intoMoneyButton)
        XCTAssertNotNil(viewController.promotionView)
        XCTAssertNotNil(viewController.discountButton)
        XCTAssertNotNil(viewController.potatoPromotionButton)
        XCTAssertNotNil(viewController.freeMondayPromotionButton)
        XCTAssertNotNil(viewController.errorMessageLabel)
    }
}
