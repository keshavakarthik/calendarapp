//
//  Calendar.swift
//  calendarapp
//
//  Created by Keshava Karthik on 30/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation

class CACalendar {
    
    let day         :   Int
    let month       :   Int
    let year        :   Int
    let weekday     :   Int
    
    public init(day:Int,
                month:Int,
                year:Int,
                weekday:Int)
    {
        self.day        =   day
        self.month      =   month
        self.year       =   year
        self.weekday    =   weekday
    }
}
