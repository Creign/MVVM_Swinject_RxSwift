//
//  TestingExTests.swift
//  TestingExTests
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import XCTest
@testable import TestingEx

class TestingExTests: XCTestCase {

    func testBaseApi() {
        XCTAssertTrue(API.getUsers().baseURL.absoluteString == "https://reqres.in/")
    }
    
    func testUsersPresenterAttachView() {
        let presenter = UsersPresenter()
        let vc = UsersViewController()
        presenter.attachView(view: vc)
        XCTAssertEqual(vc, presenter.view)
    }
    
    func testGetUsers() {
        UsersServices.getUsers(callback: { success, data, error in
            XCTAssertTrue(success)
        })
    }
    
//    func testShowUser() {
//        let str = ["id": 1,"first_name": "testfirst","last_name": "testlast","avatar": "testurl"] as [String: Any]
//        let user = Users(JSON: str)
//        let presenter = UsersPresenter()
//        presenter.showUser(user: user!)
//        let vc = UsersDetailsViewController()
//
//        XCTAssertEqual(user?.id, vc.user?.id)
//    }
//
    
    
    
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
