//
//  Exercise4ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by KhoiLe on 02/09/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa
import SwiftUI

final class Exercise4ViewModelTests: XCTestCase {
    private var viewModel: Exercise4ViewModel!
    private var navigator: Exercise4NavigatorMock!
    private var useCase: Exercise4UseCaseMock!
    
    private var input: Exercise4ViewModel.Input!
    private var output: Exercise4ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let dateTrigger = BehaviorRelay<Date>(value: Date())
    
    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        navigator = Exercise4NavigatorMock()
        useCase = Exercise4UseCaseMock()
        viewModel = Exercise4ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise4ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         dateTrigger: dateTrigger.asDriverOnErrorJustComplete())
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadHolidays() {
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.getHolidaysCalled)
    }
    
    func test_getDateColor() {
        loadTrigger.onNext(())
        
        XCTAssert(self.useCase.getDateColorCalled)
        XCTAssertEqual(self.useCase.getDateColorValues, UIColor.systemPink)
    }
}
