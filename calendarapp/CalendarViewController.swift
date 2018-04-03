//
//  ViewController.swift
//  calendarapp
//
//  Created by Keshava Karthik on 30/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    let calendarTableView = UITableView()
    let calendarReuseIdentifier = "calendarCell"
    
    let utilities = CAUtilities()
    let numberOfDaysInWeek = 7
    let screenWidth = CAUtilities().screenWidth
    
 
    let todaysCalendar
        = CACalendar(day: Calendar.current.component(.day, from: Date()),
                    month: Calendar.current.component(.month, from: Date()),
                    year: Calendar.current.component(.year, from: Date()),
                    weekday: Calendar.current.component(.weekday, from: Date()))
    
    var arrayOfYears = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CALENDAR"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(hex: 0x00BFFF),
                                                                    NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18.0, weight: .semibold)]
        
        arrayOfYears.append(todaysCalendar.year)
        
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let indexPath = IndexPath(row: 0, section: todaysCalendar.month-1)
        self.calendarTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    //MARK: - Configure Tableview
    func configureTableView() {
        calendarTableView.dataSource = self
        calendarTableView.delegate  = self
        calendarTableView.estimatedRowHeight = 100
        calendarTableView.rowHeight = UITableViewAutomaticDimension
        calendarTableView.register(CalendarCell.self, forCellReuseIdentifier: calendarReuseIdentifier)
        calendarTableView.tableFooterView = UIView()
        
        
        self.view.addSubview(calendarTableView)
        calendarTableView.translatesAutoresizingMaskIntoConstraints = false
        calendarTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        calendarTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        calendarTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        calendarTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    //MARK: - TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy MM dd"
        let endDay = utilities.getLastDayOfMonth(forMonth: section, forYear: todaysCalendar.year)
        let endDate = dateFormat.date(from: "\(todaysCalendar.year) \(section+1) \(endDay)")
        return Calendar.current.component(.weekOfMonth, from: endDate!) + 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: utilities.screenWidth, height: 40.0))
        headerView.backgroundColor = UIColor.white
        headerView.textColor = UIColor(hex: 0x00BFFF)
        headerView.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        headerView.text = "\t" + utilities.getHeader(forMonth: section+1, forYear: todaysCalendar.year)
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.calendarTableView.dequeueReusableCell(withIdentifier: calendarReuseIdentifier) as! CalendarCell
        let startingDayOfMonth = utilities.startingDayOfMonth(forMonth: indexPath.section + 1, forYear: todaysCalendar.year)
        let numberOfDaysInMonth = utilities.getLastDayOfMonth(forMonth: indexPath.section, forYear: todaysCalendar.year)
        
        if indexPath.row == 0
        {
            cell.weekdayOne.text    = "S"
            cell.weekdayTwo.text    = "M"
            cell.weekdayThree.text  = "T"
            cell.weekdayFour.text   = "W"
            cell.weekdayFive.text   = "T"
            cell.weekdaySix.text    = "F"
            cell.weekdaySeven.text  = "S"
        }
        else if indexPath.row == 1
        {
            let lastDayOfWeek = utilities.getWeekOffsetForStartingDay(startingDay: startingDayOfMonth) + 1
            
            cell.weekdayOne.text    = (lastDayOfWeek - 7) > 0 ? "\(lastDayOfWeek - 7)" : " "
            cell.weekdayTwo.text    = (lastDayOfWeek - 6) > 0 ? "\(lastDayOfWeek - 6)" : " "
            cell.weekdayThree.text  = (lastDayOfWeek - 5) > 0 ? "\(lastDayOfWeek - 5)" : " "
            cell.weekdayFour.text   = (lastDayOfWeek - 4) > 0 ? "\(lastDayOfWeek - 4)" : " "
            cell.weekdayFive.text   = (lastDayOfWeek - 3) > 0 ? "\(lastDayOfWeek - 3)" : " "
            cell.weekdaySix.text    = (lastDayOfWeek - 2) > 0 ? "\(lastDayOfWeek - 2)" : " "
            cell.weekdaySeven.text  = (lastDayOfWeek - 1) > 0 ? "\(lastDayOfWeek - 1)" : " "
            
            if indexPath.section == todaysCalendar.month - 1
            {
                if lastDayOfWeek - 7 == todaysCalendar.day
                {
                    cell.weekdayOne.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayOne.textColor = .white
                    
                }
                else if lastDayOfWeek - 6 == todaysCalendar.day
                {
                    cell.weekdayTwo.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayTwo.textColor = .white
                  
                }
                else if lastDayOfWeek - 5 == todaysCalendar.day
                {
                    cell.weekdayThree.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayThree.textColor = .white
                   
                }
                else if lastDayOfWeek - 4 == todaysCalendar.day
                {
                    cell.weekdayFour.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFour.textColor = .white
                   
                }
                else if lastDayOfWeek - 3 == todaysCalendar.day
                {
                    cell.weekdayFive.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFive.textColor = .white
                    
                }
                else if lastDayOfWeek - 2 == todaysCalendar.day
                {
                    cell.weekdaySix.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySix.textColor = .white
                    
                }
                else if lastDayOfWeek - 1 == todaysCalendar.day
                {
                    cell.weekdaySeven.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySeven.textColor = .white
                   
                }
            }
        }
        else
        {
            let lastDayOfWeek = utilities.getWeekOffsetForStartingDay(startingDay: startingDayOfMonth) + ((indexPath.row - 1) * numberOfDaysInWeek)
            
            cell.weekdayOne.text    = (lastDayOfWeek + 1) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 1)" : " "
            cell.weekdayTwo.text    = (lastDayOfWeek + 2) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 2)" : " "
            cell.weekdayThree.text  = (lastDayOfWeek + 3) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 3)" : " "
            cell.weekdayFour.text   = (lastDayOfWeek + 4) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 4)" : " "
            cell.weekdayFive.text   = (lastDayOfWeek + 5) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 5)" : " "
            cell.weekdaySix.text    = (lastDayOfWeek + 6) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 6)" : " "
            cell.weekdaySeven.text  = (lastDayOfWeek + 7) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 7)" : " "
            
            if indexPath.section == todaysCalendar.month - 1
            {
                if lastDayOfWeek + 1 == todaysCalendar.day
                {
                    cell.weekdayOne.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayOne.textColor = .white
                   
                }
                else if lastDayOfWeek + 2 == todaysCalendar.day
                {
                    cell.weekdayTwo.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayTwo.textColor = .white
                   
                }
                else if lastDayOfWeek + 3 == todaysCalendar.day
                {
                    cell.weekdayThree.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayThree.textColor = .white
                    
                }
                else if lastDayOfWeek + 4 == todaysCalendar.day
                {
                    cell.weekdayFour.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFour.textColor = .white
                    
                }
                else if lastDayOfWeek + 5 == todaysCalendar.day
                {
                    cell.weekdayFive.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFive.textColor = .white
                    
                }
                else if lastDayOfWeek + 6 == todaysCalendar.day
                {
                    cell.weekdaySix.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySix.textColor = .white
                  
                }
                else if lastDayOfWeek + 7 == todaysCalendar.day
                {
                    cell.weekdaySeven.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySeven.textColor = .white
                    
                }
            }
        }
        
        cell.layoutSubviews()
        return cell
    }
    
}

