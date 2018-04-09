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
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 2, forYear: 2000)==29)
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 2, forYear: 2004)==29)
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 2, forYear: 2008)==29)
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 2, forYear: 2001)==28)
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 2, forYear: 2003)==28)
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 2, forYear: 2009)==28)
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 12, forYear: 2000)==31)
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 4, forYear: 2000)==30)
        XCTAssertTrue(utilities.getLastDayOfMonth(forMonth: 1, forYear: 2000)==31)
    }
    
    func testWeekOffsetForStartingDay() {
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 7)==1)
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 6)==2)
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 5)==3)
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 4)==4)
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 3)==5)
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 2)==6)
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 1)==7)
        
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 10)==0)
        XCTAssertTrue(utilities.getWeekOffsetForStartingDay(startingDay: 21)==0)
        
        
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
