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
    
    let utilities = Utilities()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartingDayOfMonth() {
        XCTAssertTrue(utilities.startingDayOfMonth(forMonth: 3, forYear: 1900)==5)
        XCTAssertTrue(utilities.startingDayOfMonth(forMonth: 3, forYear: 1950)==4)
        XCTAssertTrue(utilities.startingDayOfMonth(forMonth: 1, forYear: 1988)==6)
        XCTAssertTrue(utilities.startingDayOfMonth(forMonth: 4, forYear: 2018)==1)
    }
    
    func testLastDayForMonth() {
        
    }
    
    func testWeekOffsetForStartingDay() {
        
    }
    
    func testLeapYear()
    {
        XCTAssertTrue(utilities.isLeapYear(year: 1988))
        XCTAssertFalse(utilities.isLeapYear(year: 1900))
        XCTAssertTrue(utilities.isLeapYear(year: 2000))
        XCTAssertFalse(utilities.isLeapYear(year: 1998))
    }
    
    func testgetHeader()
    {
        XCTAssertTrue(utilities.getHeader(forMonth: 10, forYear: 1988)=="October 1988")
        XCTAssertTrue(utilities.getHeader(forMonth: 12, forYear: 2019)=="December 2019")
        XCTAssertTrue(utilities.getHeader(forMonth: 1, forYear: 2000)=="January 2000")
        XCTAssertTrue(utilities.getHeader(forMonth: 2, forYear: 2018)=="February 2018")
        XCTAssertTrue(utilities.getHeader(forMonth: 4, forYear: 2017)=="April 2017")
    }
    
    
    
}
