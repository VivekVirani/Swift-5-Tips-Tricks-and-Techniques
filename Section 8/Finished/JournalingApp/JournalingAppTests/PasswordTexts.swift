//
//  PasswordTexts.swift
//  JournalingAppTests
//
//  Created by Philipp Baldauf on 14.03.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import XCTest
@testable import JournalingApp

class PasswordTexts: XCTestCase {

    let passwordStore = PasswordStore()

    override func tearDown() {
        passwordStore.delete()
    }

    func testStore() {
        XCTAssertFalse(passwordStore.check(password: "123456"))
        passwordStore.store(password: "123456")
        XCTAssertFalse(passwordStore.check(password: "password"))
        XCTAssertTrue(passwordStore.check(password: "123456"))
    }
    
    func testCheck() {
        let randomPassword = UUID().uuidString
        XCTAssertFalse(passwordStore.check(password: "123456"))
        XCTAssertFalse(passwordStore.check(password: randomPassword))
        passwordStore.store(password: randomPassword)
        XCTAssertFalse(passwordStore.check(password: "password"))
        XCTAssertFalse(passwordStore.check(password: "123456"))
        XCTAssertTrue(passwordStore.check(password: randomPassword))
    }
    
    func testDelete() {
        XCTAssertFalse(passwordStore.check(password: "123456"))
        passwordStore.store(password: "123456")
        XCTAssertTrue(passwordStore.check(password: "123456"))
        passwordStore.delete()
        XCTAssertFalse(passwordStore.check(password: "123456"))
    }
}
