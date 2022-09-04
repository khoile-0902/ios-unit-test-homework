//
//  Excercise5UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by KhoiLe on 04/09/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise5UseCaseMock: Exercise5UseCaseType {
    var calculateFeeCalled = false
    var calculateFeeValues = CalculatePizzaFeeResult(fee: 10.0, promotions: [.discount20Percent])
    
    func calculateFee(dto: PizzaOrderDto) -> CalculatePizzaFeeResult {
        calculateFeeCalled = true
        return calculateFeeValues
    }
    
    var validatePizzaPriceCalled = false
    var validatePizzaPriceValues = PizzaOrderDto.validatePizzaPrice("100").mapToVoid()
    
    func validatePizzaPrice(_ price: String) -> ValidationResult {
        validatePizzaPriceCalled = true
        return validatePizzaPriceValues
    }
}
