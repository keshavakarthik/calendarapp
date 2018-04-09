//
//  Appointment.swift
//  calendarapp
//
//  Created by Keshava Karthik on 09/04/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation
import UIKit

public enum Classification {
    
    case personal
    case official
    case others
    
    var classificationColor : UIColor {
        switch self {
        case .official:
            return .red
        case .personal:
            return .green
        case .others:
            return .yellow
        }
    }
}


public class Appointment {
    
    let   startTime         :   String
    let   totalDuration     :   String
    let   title             :   String
    let   location          :   String
    let   classificaition   :   Classification
    
    public init(startTime : String,
                totalDuration : String,
                title : String,
                location : String,
                classification : Classification)
    {
        self.startTime          =   startTime
        self.totalDuration      =   totalDuration
        self.title              =   title
        self.location           =   location
        self.classificaition    =   classification
    }
    
}
