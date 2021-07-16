//
//  NewsServiceTests.swift
//  CoreTests
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import XCTest
import Nimble
import SwiftyMocky
@testable import Core

class NewsServiceTests: XCTestCase {
    var service: MoyaProviderMock!

    override func setUp() {
        super.setUp()

        service = MoyaProviderMock()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testSuccessfulRequest() throws {
    }

}
