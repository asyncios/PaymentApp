//
//  PaymentMethodPresenterTest.swift
//  PaymentAppTests
//
//  Created by Nisum on 2/28/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import XCTest
@testable import PaymentApp

class PaymentMethodPresenterTest: XCTestCase {
    
    var mockView: MockPaymentMethodView!
    var repositorySuccess: PaymentRepository!
    var repositoryError: PaymentRepository!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockView = MockPaymentMethodView()
        repositorySuccess = MockPaymentRepositorySuccess()
        repositoryError = MockPaymentRepositoryError()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetPaymentMethodsSuccess(){
        let presenter = PaymentMethodsPresenter.init(delegate: mockView, repository: repositorySuccess)
        presenter.getPaymentMethods()
        XCTAssert(mockView.wasCalled(callIdentifier: "show(_:methods)"), "there was an unknown error")
    }
    
    func testGetPaymentMethodsError(){
        let presenter = PaymentMethodsPresenter.init(delegate: mockView, repository: repositoryError)
        presenter.getPaymentMethods()
        XCTAssert(mockView.wasCalled(callIdentifier: "show(_:error)"), "there was an unknown error")
    }
}
