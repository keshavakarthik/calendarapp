//
//  AgendaViewController.swift
//  calendarapp
//
//  Created by Keshava Karthik on 09/04/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation
import UIKit

class AgendaViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let agendaTableView = UITableView()
    let agendaReuseIdentifier = "AgendaCell"
    
    let appointmentData = AppointmentData().appointmentData
    var allKeys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Appointments"
        
        self.view.backgroundColor = .white
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(hex: 0x00BFFF),
                                                                        NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18.0, weight: .semibold)]
        let backButton:UIButton = UIButton(type: .custom) as UIButton
        backButton.addTarget(self, action: #selector(AgendaViewController.backButtonClicked), for: .touchUpInside)
        backButton.setImage(#imageLiteral(resourceName: "Back"), for: .normal)
        backButton.sizeToFit()
        let backBarButton:UIBarButtonItem = UIBarButtonItem(customView: backButton)
        
        self.navigationItem.leftBarButtonItem = backBarButton
        
        allKeys = Array(appointmentData.keys)
        
        configureTableView()
        
    }
    
    
    //MARK: Navigation
    @objc func backButtonClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Configure Tableview
    func configureTableView() {
        agendaTableView.dataSource = self
        agendaTableView.delegate  = self
        agendaTableView.estimatedRowHeight = 100
        agendaTableView.rowHeight = UITableViewAutomaticDimension
        agendaTableView.register(AgendaCell.self, forCellReuseIdentifier: agendaReuseIdentifier)
        agendaTableView.tableFooterView = UIView()
        
        
        self.view.addSubview(agendaTableView)
        agendaTableView.translatesAutoresizingMaskIntoConstraints = false
        agendaTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        agendaTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        agendaTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        agendaTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    //MARK: - TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return appointmentData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let key = allKeys[section]
        let values = appointmentData[key] ?? []
        return values.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: Utilities().screenWidth, height: 40.0))
        headerView.backgroundColor = UIColor.white
        headerView.textColor = UIColor.black
        headerView.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        headerView.text = "\t" + Utilities().getAgendaHeader(dateString: allKeys[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.agendaTableView.dequeueReusableCell(withIdentifier: agendaReuseIdentifier) as! AgendaCell
        
        let key         = allKeys[indexPath.section]
        let values      = appointmentData[key] ?? []
        if values.count > 0
        {
            let appointment = values[indexPath.row]
            cell.eventStartTime.text = appointment.startTime
            cell.eventDuration.text = appointment.totalDuration
            cell.classificationColor.backgroundColor = appointment.classificaition.classificationColor
            cell.eventTitle.text = "  " + appointment.title
            cell.eventLocation.text = "  " + appointment.location
        }
        
        cell.layoutSubviews()
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
