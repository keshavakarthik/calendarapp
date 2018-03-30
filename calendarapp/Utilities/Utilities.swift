//
//  Utilities.swift
//  calendarapp
//
//  Created by Keshava Karthik on 30/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation

open class CAUtilities {
    
    /**
     Starting weekday of a month
    */
    func startingDayOfMonth(dateString:String) -> Int
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        guard let startingDayOfMonth = formatter.date(from: dateString) else
        {
            print("Date conversion error")
            return -1
        }
        
        return Calendar.current.component(.weekday, from: startingDayOfMonth)
    }
    
    /**
     Checks whether the year is leap year
     
     An year is a leap year if it can be evenly divided by 4. If year can be evenly divided by 100 then it is a leap year iff it can be evenly divided by 400 also
    */
    func isLeapYear(year: Int) -> Bool
    {
        if year % 4 != 0
        {
            return false
        }
        else
        {
            if year % 100 == 0
            {
                if year % 400 == 0
                {
                    return true
                }
                
                return false
            }
            
            return true
        }
    }
    
}
