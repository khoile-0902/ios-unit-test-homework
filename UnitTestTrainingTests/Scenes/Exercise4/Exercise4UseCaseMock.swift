//
//  Exercise4UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by KhoiLe on 02/09/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import XCTest
import Dto

final class Exercise4UseCaseMock: Exercise4UseCaseType {
    
    var getHolidaysCalled = false
    var getHolidaysValues = [Date()]
    
    func getHolidays() -> [Date] {
        getHolidaysCalled = true
        return getHolidaysValues
    }
    
    var getDateColorCalled = false
    var getDateColorValues = UIColor.systemPink
    
    func getDateColor(dto: GetDateColorDto) -> UIColor {
        getDateColorCalled = true
        return getDateColorValues
    }
}
