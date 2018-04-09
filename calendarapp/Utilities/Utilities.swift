//
//  Utilities.swift
//  calendarapp
//
//  Created by Keshava Karthik on 30/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation
import UIKit

open class Utilities {
    
    let screenHeight : CGFloat = {
        return UIScreen.main.bounds.size.height
    }()
    
    let screenWidth : CGFloat = {
        return UIScreen.main.bounds.size.width
    }()
    
    /**
     Get Date String
    */
    func getDateString(date:Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    /**
     Get TableView Header String
    */
    func getHeader(forMonth month:Int, forYear year: Int)->String
    {
        switch month {
        case 1:
            return "January \(year)"
        case 2:
            return "February \(year)"
        case 3:
            return "March \(year)"
        case 4:
            return "April \(year)"
        case 5:
            return "May \(year)"
        case 6:
            return "June \(year)"
        case 7:
            return "July \(year)"
        case 8:
            return "August \(year)"
        case 9:
            return "September \(year)"
        case 10:
            return "October \(year)"
        case 11:
            return "November \(year)"
        case 12:
            return "December \(year)"
        default:
            return ""
        }
    }
    
    /**
     Get Agenda Header from date String
    */
    func getAgendaHeader(dateString:String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        guard let date = formatter.date(from: dateString) else
        {
            print("Date conversion error")
            return ""
        }
        
        formatter.dateFormat = "dd'th' MMM, yyyy"
        
        let headerString = formatter.string(from: date)
        return headerString
    }
    
    /**
     Starting weekday of a month
    */
    func startingDayOfMonth(forMonth month:Int, forYear year:Int) -> Int
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        guard let startingDayOfMonth = formatter.date(from: "\(year) \(month) 01") else
        {
            print("Date conversion error")
            return -1
        }
        
        return Calendar.current.component(.weekday, from: startingDayOfMonth)
    }
    
    /**
     Get Last Day of the Month
    */
    
    func getLastDayOfMonth(forMonth month:Int, forYear year:Int) -> Int
    {
        var endDay = -1
        if month == 2
        {
            if self.isLeapYear(year: year)
            {
                endDay = 29
            }
            else
            {
                endDay = 28
            }
        }
        else if month <= 7
        {
            if month % 2 == 1
            {
                endDay = 31
            }
            else
            {
                endDay = 30
            }
        }
        else
        {
            if month % 2 == 0
            {
                endDay = 31
            }
            else
            {
                endDay = 30
            }
        }
        return endDay
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
    
    func getWeekOffsetForStartingDay(startingDay day:Int) -> Int
    {
        switch day {
        case 1:
            return 7
        case 2:
            return 6
        case 3:
            return 5
        case 4:
            return 4
        case 5:
            return 3
        case 6:
            return 2
        case 7:
            return 1
        default:
            return 0
        }
    }
}
