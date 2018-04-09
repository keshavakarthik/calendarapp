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
    
    let utilities = Utilities()
    let numberOfDaysInWeek = 7
    let screenWidth = Utilities().screenWidth
    
 
    let calendarDatasource = CalendarData()
    let currentMonth = Calendar.current.component(.month, from: Date())
    let currentDay   = Calendar.current.component(.day, from: Date())
    let currentYear  = Calendar.current.component(.year, from: Date())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CALENDAR"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(hex: 0x00BFFF),
                                                                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18.0, weight: .semibold)]
        
        
        let agendaButton:UIButton = UIButton(type: .custom) as UIButton
        agendaButton.addTarget(self, action: #selector(CalendarViewController.agendaClicked), for: .touchUpInside)
        agendaButton.setImage(#imageLiteral(resourceName: "Agenda"), for: .normal)
        agendaButton.sizeToFit()
        let agendaBarButton:UIBarButtonItem = UIBarButtonItem(customView: agendaButton)
        
        let addButton:UIButton = UIButton(type: .custom) as UIButton
        addButton.addTarget(self, action: #selector(CalendarViewController.addClicked), for: .touchUpInside)
        addButton.setImage(#imageLiteral(resourceName: "Add"), for: .normal)
        addButton.sizeToFit()
        let addBarButton:UIBarButtonItem = UIBarButtonItem(customView: addButton)
        
        self.navigationItem.rightBarButtonItems = [agendaBarButton,addBarButton]
        
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let indexPath = IndexPath(row: 0, section: ((currentYear-startOfcalendarYear)*12)+currentMonth-1)
        self.calendarTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    //MARK: - Navigations
    @objc func agendaClicked()
    {
        let agendaViewController = AgendaViewController()
        self.navigationController?.pushViewController(agendaViewController, animated: true)
    }
    
    @objc func addClicked()
    {
       print("Add Clicked")
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
        return calendarDatasource.calendarData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy MM dd"
        let endDate = dateFormat.date(from: "\(calendarDatasource.calendarData[section].year) \(calendarDatasource.calendarData[section].month) \(calendarDatasource.calendarData[section].lastDay)")
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
        headerView.text = "\t" + utilities.getHeader(forMonth: calendarDatasource.calendarData[section].month, forYear: calendarDatasource.calendarData[section].year)
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.calendarTableView.dequeueReusableCell(withIdentifier: calendarReuseIdentifier) as! CalendarCell
        
        let startingDayOfMonth = utilities.startingDayOfMonth(forMonth: calendarDatasource.calendarData[indexPath.section].month, forYear: calendarDatasource.calendarData[indexPath.section].year)
        
        let numberOfDaysInMonth = utilities.getLastDayOfMonth(forMonth: calendarDatasource.calendarData[indexPath.section].month, forYear: calendarDatasource.calendarData[indexPath.section].year)
        
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
            
            if calendarDatasource.calendarData[indexPath.section].month == currentMonth && calendarDatasource.calendarData[indexPath.section].year == currentYear
            {
                if lastDayOfWeek - 7 == currentDay
                {
                    cell.weekdayOne.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayOne.textColor = .white
                    
                }
                else if lastDayOfWeek - 6 == currentDay
                {
                    cell.weekdayTwo.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayTwo.textColor = .white
                  
                }
                else if lastDayOfWeek - 5 == currentDay
                {
                    cell.weekdayThree.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayThree.textColor = .white
                   
                }
                else if lastDayOfWeek - 4 == currentDay
                {
                    cell.weekdayFour.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFour.textColor = .white
                   
                }
                else if lastDayOfWeek - 3 == currentDay
                {
                    cell.weekdayFive.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFive.textColor = .white
                    
                }
                else if lastDayOfWeek - 2 == currentDay
                {
                    cell.weekdaySix.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySix.textColor = .white
                    
                }
                else if lastDayOfWeek - 1 == currentDay
                {
                    cell.weekdaySeven.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySeven.textColor = .white
                   
                }
            }
        }
        else if indexPath.row == 2
        {
            let lastDayOfWeek = utilities.getWeekOffsetForStartingDay(startingDay: startingDayOfMonth)
            
            cell.weekdayOne.text    = (lastDayOfWeek + 1) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 1)" : " "
            cell.weekdayTwo.text    = (lastDayOfWeek + 2) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 2)" : " "
            cell.weekdayThree.text  = (lastDayOfWeek + 3) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 3)" : " "
            cell.weekdayFour.text   = (lastDayOfWeek + 4) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 4)" : " "
            cell.weekdayFive.text   = (lastDayOfWeek + 5) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 5)" : " "
            cell.weekdaySix.text    = (lastDayOfWeek + 6) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 6)" : " "
            cell.weekdaySeven.text  = (lastDayOfWeek + 7) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 7)" : " "
            
            if calendarDatasource.calendarData[indexPath.section].month == currentMonth && calendarDatasource.calendarData[indexPath.section].year == currentYear
            {
                if lastDayOfWeek - 7 == currentDay
                {
                    cell.weekdayOne.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayOne.textColor = .white
                    
                }
                else if lastDayOfWeek - 6 == currentDay
                {
                    cell.weekdayTwo.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayTwo.textColor = .white
                    
                }
                else if lastDayOfWeek - 5 == currentDay
                {
                    cell.weekdayThree.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayThree.textColor = .white
                    
                }
                else if lastDayOfWeek - 4 == currentDay
                {
                    cell.weekdayFour.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFour.textColor = .white
                    
                }
                else if lastDayOfWeek - 3 == currentDay
                {
                    cell.weekdayFive.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFive.textColor = .white
                    
                }
                else if lastDayOfWeek - 2 == currentDay
                {
                    cell.weekdaySix.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySix.textColor = .white
                    
                }
                else if lastDayOfWeek - 1 == currentDay
                {
                    cell.weekdaySeven.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySeven.textColor = .white
                    
                }
            }
            
            if calendarDatasource.calendarData[indexPath.section].month == currentMonth && calendarDatasource.calendarData[indexPath.section].year == currentYear
            {
                if lastDayOfWeek + 1 == currentDay
                {
                    cell.weekdayOne.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayOne.textColor = .white
                    
                }
                else if lastDayOfWeek + 2 == currentDay
                {
                    cell.weekdayTwo.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayTwo.textColor = .white
                    
                }
                else if lastDayOfWeek + 3 == currentDay
                {
                    cell.weekdayThree.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayThree.textColor = .white
                    
                }
                else if lastDayOfWeek + 4 == currentDay
                {
                    cell.weekdayFour.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFour.textColor = .white
                    
                }
                else if lastDayOfWeek + 5 == currentDay
                {
                    cell.weekdayFive.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFive.textColor = .white
                    
                }
                else if lastDayOfWeek + 6 == currentDay
                {
                    cell.weekdaySix.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySix.textColor = .white
                    
                }
                else if lastDayOfWeek + 7 == currentDay
                {
                    cell.weekdaySeven.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySeven.textColor = .white
                    
                }
            }
        }
        else
        {
            let lastDayOfWeek = utilities.getWeekOffsetForStartingDay(startingDay: startingDayOfMonth) + ((indexPath.row - 2) * numberOfDaysInWeek)
            
            cell.weekdayOne.text    = (lastDayOfWeek + 1) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 1)" : " "
            cell.weekdayTwo.text    = (lastDayOfWeek + 2) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 2)" : " "
            cell.weekdayThree.text  = (lastDayOfWeek + 3) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 3)" : " "
            cell.weekdayFour.text   = (lastDayOfWeek + 4) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 4)" : " "
            cell.weekdayFive.text   = (lastDayOfWeek + 5) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 5)" : " "
            cell.weekdaySix.text    = (lastDayOfWeek + 6) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 6)" : " "
            cell.weekdaySeven.text  = (lastDayOfWeek + 7) <= numberOfDaysInMonth ? "\(lastDayOfWeek + 7)" : " "
            
           if calendarDatasource.calendarData[indexPath.section].month == currentMonth && calendarDatasource.calendarData[indexPath.section].year == currentYear
            {
                if lastDayOfWeek + 1 == currentDay
                {
                    cell.weekdayOne.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayOne.textColor = .white
                   
                }
                else if lastDayOfWeek + 2 == currentDay
                {
                    cell.weekdayTwo.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayTwo.textColor = .white
                   
                }
                else if lastDayOfWeek + 3 == currentDay
                {
                    cell.weekdayThree.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayThree.textColor = .white
                    
                }
                else if lastDayOfWeek + 4 == currentDay
                {
                    cell.weekdayFour.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFour.textColor = .white
                    
                }
                else if lastDayOfWeek + 5 == currentDay
                {
                    cell.weekdayFive.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdayFive.textColor = .white
                    
                }
                else if lastDayOfWeek + 6 == currentDay
                {
                    cell.weekdaySix.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySix.textColor = .white
                  
                }
                else if lastDayOfWeek + 7 == currentDay
                {
                    cell.weekdaySeven.backgroundColor = UIColor(hex: 0x00BFFF)
                    cell.weekdaySeven.textColor = .white
                    
                }
            }
        }
        
        
        
        cell.layoutSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == calendarDatasource.calendarData.count - 1
        {
            let year = calendarDatasource.calendarData[indexPath.section - 1].year
            
            for month in 1..<13
            {
                let calendar = CalendarModel(month: month,
                                          year: year+1)
                
                calendarDatasource.calendarData.append(calendar)
            }
            
            tableView.reloadData()
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
        
    }
    
}

