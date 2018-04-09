//
//  CalendarCell.swift
//  calendarapp
//
//  Created by Keshava Karthik on 30/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation
import UIKit
/**
 CalendarCell represents a row in Calendar Table View Controller.
 
 Row contains 7 weekdays statring from Sunday to Saturday.
*/
class CalendarCell : UITableViewCell  {
    let weekdayOne      = UILabel()
    let weekdayTwo      = UILabel()
    let weekdayThree    = UILabel()
    let weekdayFour     = UILabel()
    let weekdayFive     = UILabel()
    let weekdaySix      = UILabel()
    let weekdaySeven    = UILabel()
    
    let screenWidth = Utilities().screenWidth
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        //Initialize weekdayOne Label
        contentView.addSubview(weekdayOne)
        weekdayOne.translatesAutoresizingMaskIntoConstraints = false
        
        weekdayOne.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 20.0).isActive = true
        weekdayOne.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        weekdayOne.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        //Initialize weekdayTwo Label
        contentView.addSubview(weekdayTwo)
        weekdayTwo.translatesAutoresizingMaskIntoConstraints = false
        weekdayTwo.leadingAnchor.constraint(equalTo: weekdayOne.trailingAnchor).isActive = true
        weekdayTwo.topAnchor.constraint(equalTo: weekdayOne.topAnchor).isActive = true
       
        
        //Initialize weekdayThree Label
        contentView.addSubview(weekdayThree)
        weekdayThree.translatesAutoresizingMaskIntoConstraints = false
        weekdayThree.leadingAnchor.constraint(equalTo: weekdayTwo.trailingAnchor).isActive = true
        weekdayThree.topAnchor.constraint(equalTo: weekdayOne.topAnchor).isActive = true
        
        
        //Initialize weekdayFour Label
        contentView.addSubview(weekdayFour)
        weekdayFour.translatesAutoresizingMaskIntoConstraints = false
        weekdayFour.leadingAnchor.constraint(equalTo: weekdayThree.trailingAnchor).isActive = true
        weekdayFour.topAnchor.constraint(equalTo: weekdayOne.topAnchor).isActive = true
        
        
        //Initialize weekdayFive Label
        contentView.addSubview(weekdayFive)
        weekdayFive.translatesAutoresizingMaskIntoConstraints = false
        weekdayFive.leadingAnchor.constraint(equalTo: weekdayFour.trailingAnchor).isActive = true
        weekdayFive.topAnchor.constraint(equalTo: weekdayOne.topAnchor).isActive = true
        
        //Initialize weekdaySix Label
        contentView.addSubview(weekdaySix)
        weekdaySix.translatesAutoresizingMaskIntoConstraints = false
        weekdaySix.leadingAnchor.constraint(equalTo: weekdayFive.trailingAnchor).isActive = true
        weekdaySix.topAnchor.constraint(equalTo: weekdayOne.topAnchor).isActive = true
       
        
        //Initialize weekdaySeven Label
        contentView.addSubview(weekdaySeven)
        weekdaySeven.translatesAutoresizingMaskIntoConstraints = false
        weekdaySeven.leadingAnchor.constraint(equalTo: weekdaySix.trailingAnchor).isActive = true
        weekdaySeven.topAnchor.constraint(equalTo: weekdayOne.topAnchor).isActive = true
        
        
        //Same Width Constraint
        weekdayOne.widthAnchor.constraint(equalToConstant: (screenWidth-40.0)/7.0).isActive = true
        weekdayTwo.widthAnchor.constraint(equalTo: weekdayOne.widthAnchor, multiplier: 1.0).isActive = true
        weekdayThree.widthAnchor.constraint(equalTo: weekdayOne.widthAnchor, multiplier: 1.0).isActive = true
        weekdayFour.widthAnchor.constraint(equalTo: weekdayOne.widthAnchor, multiplier: 1.0).isActive = true
        weekdayFive.widthAnchor.constraint(equalTo: weekdayOne.widthAnchor, multiplier: 1.0).isActive = true
        weekdaySix.widthAnchor.constraint(equalTo: weekdayOne.widthAnchor, multiplier: 1.0).isActive = true
        weekdaySeven.widthAnchor.constraint(equalTo: weekdayOne.widthAnchor, multiplier: 1.0).isActive = true
        
        
        weekdayOne.font     = UIFont.systemFont(ofSize: 18, weight: .regular)
        weekdayTwo.font     = UIFont.systemFont(ofSize: 18, weight: .regular)
        weekdayThree.font   = UIFont.systemFont(ofSize: 18, weight: .regular)
        weekdayFour.font    = UIFont.systemFont(ofSize: 18, weight: .regular)
        weekdayFive.font    = UIFont.systemFont(ofSize: 18, weight: .regular)
        weekdaySix.font     = UIFont.systemFont(ofSize: 18, weight: .regular)
        weekdaySeven.font   = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        weekdayOne.textAlignment    = .center
        weekdayTwo.textAlignment    = .center
        weekdayThree.textAlignment  = .center
        weekdayFour.textAlignment   = .center
        weekdayFive.textAlignment   = .center
        weekdaySix.textAlignment    = .center
        weekdaySeven.textAlignment  = .center
        
        weekdayOne.layer.masksToBounds    = true
        weekdayTwo.layer.masksToBounds    = true
        weekdayThree.layer.masksToBounds  = true
        weekdayFour.layer.masksToBounds   = true
        weekdayFive.layer.masksToBounds   = true
        weekdaySix.layer.masksToBounds    = true
        weekdaySeven.layer.masksToBounds  = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        weekdayOne.text = " "
        weekdayTwo.text = " "
        weekdayThree.text = " "
        weekdayFour.text = " "
        weekdayFive.text = " "
        weekdaySix.text = " "
        weekdaySeven.text = " "
        
        weekdayOne.backgroundColor      = .white
        weekdayOne.textColor            = .black
        weekdayTwo.backgroundColor      = .white
        weekdayTwo.textColor            = .black
        weekdayThree.backgroundColor    = .white
        weekdayThree.textColor          = .black
        weekdayFour.backgroundColor     = .white
        weekdayFour.textColor           = .black
        weekdayFive.backgroundColor     = .white
        weekdayFive.textColor           = .black
        weekdaySix.backgroundColor      = .white
        weekdaySix.textColor            = .black
        weekdaySeven.backgroundColor    = .white
        weekdaySeven.textColor          = .black
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        weekdayOne.layer.cornerRadius   = 10
        weekdayTwo.layer.cornerRadius   = 10
        weekdayThree.layer.cornerRadius = 10
        weekdayFour.layer.cornerRadius  = 10
        weekdayFive.layer.cornerRadius  = 10
        weekdaySix.layer.cornerRadius   = 10
        weekdaySeven.layer.cornerRadius = 10
    }
}
