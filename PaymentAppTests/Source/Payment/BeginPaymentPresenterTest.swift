//
//  BeginPaymentPresenterImplTest.swift
//  PaymentAppTests
//
//  Created by Nisum on 2/28/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import XCTest
@testable import PaymentApp

class BeginPaymentPresenterTest: XCTestCase {
    
    var mockView: MockBeginPaymentView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockView = MockBeginPaymentView()
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
    
    func testAmountSuccess(){
        let value = "40.0"
        let presenter = BeginPaymentPresenter.init(delegate: mockView)
        presenter.applyAmount(string: value)
        XCTAssert(mockView.wasCalled(callIdentifier: "show(_:double)"), "there was an unknown error")
    }
    
    func testAmountError(){
        let value = "3d3asd"
        let presenter = BeginPaymentPresenter.init(delegate: mockView)
        presenter.applyAmount(string: value)
        XCTAssert(mockView.wasCalled(callIdentifier: "show(_:string)"), "there was an unknown error")
    }
}
