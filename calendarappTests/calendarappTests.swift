//
//  calendarappTests.swift
//  calendarappTests
//
//  Created by Keshava Karthik on 30/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import XCTest
@testable import calendarapp

class calendarappTests: XCTestCase {
    
    let utilities = CAUtilities()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartingMonth() {
        XCTAssertTrue(utilities.startingDayOfMonth(dateString:"1900 03 01") == 5)
        XCTAssertTrue(utilities.startingDayOfMonth(dateString:"1950 03 01") == 4)
        XCTAssertTrue(utilities.startingDayOfMonth(dateString:"1988 01 01") == 6)
        XCTAssertTrue(utilities.startingDayOfMonth(dateString:"2018 04 01") == 1)
    }
    
    func testLeapYear()
    {
        XCTAssertTrue(utilities.isLeapYear(year: 1988))
        XCTAssertFalse(utilities.isLeapYear(year: 1900))
        XCTAssertTrue(utilities.isLeapYear(year: 2000))
        XCTAssertFalse(utilities.isLeapYear(year: 1998))
    }
    
    
    
}
