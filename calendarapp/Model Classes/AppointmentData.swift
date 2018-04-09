//
//  AppointmentData.swift
//  calendarapp
//
//  Created by Keshava Karthik on 09/04/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation

public class AppointmentData {
    
    var appointmentData = [String:[Appointment]]()
    
    public init()
    {
        let nextDaysDateString = Utilities().getDateString(date: Date().addingTimeInterval(86400))
        appointmentData[nextDaysDateString] = self.getNextDayAppointments()
        
        let todaysDateString = Utilities().getDateString(date: Date())
        appointmentData[todaysDateString] = self.getTodaysAppointments()
        
    }
    
    func getTodaysAppointments() -> [Appointment]
    {
        var todaysAppointments = [Appointment]()
        
        let appointmentOne = Appointment(startTime: "10:00 AM",
                                         totalDuration: "15 Minutes",
                                         title: "Scrum Meeting",
                                         location: "ABC India Limited, Whitefield, Bengaluru",
                                         classification: .official)
        let appointmentTwo = Appointment(startTime: "6:00 PM",
                                         totalDuration: "1 Hour",
                                         title: "Date with girlfirend",
                                         location: "White Orchids, Bengaluru",
                                         classification: .personal)
        
        todaysAppointments.append(appointmentOne)
        todaysAppointments.append(appointmentTwo)
        
        return todaysAppointments
    }
    
    func getNextDayAppointments() -> [Appointment]
    {
        var nextDayAppointments = [Appointment]()
        
        let appointmentOne = Appointment(startTime: "10:00 AM",
                                         totalDuration: "15 Minutes",
                                         title: "Scrum Meeting",
                                         location: "ABC India Limited, Whitefield, Bengaluru",
                                         classification: .official)
        let appointmentTwo = Appointment(startTime: "04:30 PM",
                                         totalDuration: "15 Minutes",
                                         title: "Buy Groceries",
                                         location: "Big Bazar, R.R.Nagar, Bengaluru",
                                         classification: .others)
        
        nextDayAppointments.append(appointmentOne)
        nextDayAppointments.append(appointmentTwo)
        
        return nextDayAppointments
    }
    
}
