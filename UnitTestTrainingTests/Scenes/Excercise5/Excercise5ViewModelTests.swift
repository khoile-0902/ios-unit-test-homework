//
//  Excercise5ModelTests.swift
//  UnitTestTrainingTests
//
//  Created by KhoiLe on 04/09/2022.
//  Copyright © 2022 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise5ViewModelTests: XCTestCase {
    private var viewModel: Exercise5ViewModel!
    private var navigator: Exercise5NavigatorMock!
    private var useCase: Exercise5UseCaseMock!
    
    private var input: Exercise5ViewModel.Input!
    private var output: Exercise5ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let priceTrigger = PublishSubject<String>()
    private let receiveMethodTrigger = BehaviorRelay<Int>(value: 0)
    private let usingCouponTrigger = BehaviorRelay<Bool>(value: false)
    private let intoMoneyTrigger = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        navigator = Exercise5NavigatorMock()
        useCase = Exercise5UseCaseMock()
        viewModel = Exercise5ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise5ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         priceTrigger: priceTrigger.asDriverOnErrorJustComplete(),
                                         receiveMethodTrigger: receiveMethodTrigger.asDriver(),
                                         usingCouponTrigger: usingCouponTrigger.asDriver(),
                                         intoMoneyTrigger: intoMoneyTrigger.asDriverOnErrorJustComplete())
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_calculateFee() {
        intoMoneyTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateFeeCalled)
        XCTAssertEqual(output.fee.fee, 10.0)
    }
    
    func test_validatePizzaPrice() {
        priceTrigger.onNext("100")
        
        XCTAssert(self.useCase.validatePizzaPriceCalled)
        XCTAssertEqual(output.errorMessage, "")
    }
    
    
}
