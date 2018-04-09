//
//  CalendarData.swift
//  calendarapp
//
//  Created by Keshava Karthik on 05/04/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation

let startOfcalendarYear = 1900

public class CalendarData {
    
    var calendarData = [CalendarModel]()
    let currentYear  = Calendar.current.component(.year, from: Date())
    
    public init()
    {
        for year in startOfcalendarYear..<currentYear+1
        {
            for month in 1..<13
            {
                let calendar = CalendarModel(month: month, year: year)
                calendarData.append(calendar)
            }
        }
    }
    
}
