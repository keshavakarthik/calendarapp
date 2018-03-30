//
//  Weekday.swift
//  calendarapp
//
//  Created by Keshava Karthik on 30/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation

public enum Weekday  {
   
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    
    public var weekdayShortCode : String {
        switch self.hashValue {
        case 01:
            return "SUN"
        case 02:
            return "MON"
        case 03:
            return "TUE"
        case 04:
            return "WED"
        case 05:
            return "THU"
        case 06:
            return "FRI"
        case 07:
            return "SAT"
        default:
            return ""
        }
    }
    
    public var weekdayVerShortCode : String {
        switch self.hashValue {
        case 01:
            return "S"
        case 02:
            return "M"
        case 03:
            return "T"
        case 04:
            return "W"
        case 05:
            return "T"
        case 06:
            return "F"
        case 07:
            return "S"
        default:
            return ""
        }
    }
}
