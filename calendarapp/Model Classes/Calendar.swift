//
//  Calendar.swift
//  calendarapp
//
//  Created by Keshava Karthik on 30/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation

class CalendarModel {
    
    let startingDay         :   Int
    let lastDay             :   Int
    let month               :   Int
    let year                :   Int
    
    public init(month:Int,
                year:Int)
    {
        self.startingDay    =   1
        self.lastDay        =   Utilities().getLastDayOfMonth(forMonth: month, forYear: year)
        self.month          =   month
        self.year           =   year
        
    }
}
