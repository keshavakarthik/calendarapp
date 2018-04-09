//
//  AgendaCell.swift
//  calendarapp
//
//  Created by Keshava Karthik on 06/04/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation
import UIKit

class AgendaCell : UITableViewCell {
    
    let eventStartTime      = UILabel()
    let eventDuration       = UILabel()
    let classificationColor = UILabel()
    let eventTitle          = UILabel()
    let locationImage       = UIImageView()
    let eventLocation          = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         let marginGuide = contentView.layoutMarginsGuide
        
         /*
           1. eventStartTime and eventDuration Labels are aligned to left side of the cell one below the other.
           2. eventStartTime is on top of eventDuration.
           3. Both the labels are of equal height and width.
           4. Height = 50.0 and Width = 100.0
         */
         contentView.addSubview(eventStartTime)
         contentView.addSubview(eventDuration)
        
         eventStartTime.translatesAutoresizingMaskIntoConstraints = false
         eventDuration.translatesAutoresizingMaskIntoConstraints  = false
        
         eventStartTime.leftAnchor.constraint(equalTo: marginGuide.leftAnchor).isActive = true
         eventStartTime.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
         eventDuration.topAnchor.constraint(equalTo: eventStartTime.bottomAnchor).isActive = true
         eventDuration.leftAnchor.constraint(equalTo: marginGuide.leftAnchor).isActive = true
         eventDuration.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
         eventStartTime.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
         eventStartTime.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
         eventDuration.widthAnchor.constraint(equalTo: eventStartTime.widthAnchor, multiplier: 1.0).isActive = true
         eventDuration.heightAnchor.constraint(equalTo: eventStartTime.heightAnchor, multiplier: 1.0).isActive = true
        
        /*
         Label properties
         */
        eventStartTime.textAlignment = .center
        eventStartTime.textColor     = .black
        eventStartTime.font          = UIFont.systemFont(ofSize: 16, weight: .regular)
        eventDuration.textAlignment  = .center
        eventDuration.textColor      = .lightGray
        eventDuration.font           = UIFont.systemFont(ofSize: 14, weight: .light)
        
        /*
          1.classificationColor is placed next to eventStartTime
          2. Height and Width are set to 20.0
          3. By default it will be white in color
         */
        contentView.addSubview(classificationColor)
        
        classificationColor.leftAnchor.constraint(equalTo: eventStartTime.rightAnchor).isActive = true
        classificationColor.topAnchor.constraint(equalTo: eventStartTime.topAnchor).isActive   = true
        
        classificationColor.widthAnchor.constraint(equalToConstant: 20.0)
        classificationColor.heightAnchor.constraint(equalToConstant: 20.0)
        
        classificationColor.backgroundColor = .white
        
        /*
         1.eventTitle is placed next to classificationColor. Top Edge aligned to classificationColor Top Edge.
         2.locationImage is placed below eventTitle. Its leading edge is aligned to leading edge of eventTitle.
         3.eventLocation will be placed next to location image.
         4. eventTitle, locationImage and eventLocation will have equal heights.
         */
        
        eventTitle.leftAnchor.constraint(equalTo: classificationColor.rightAnchor).isActive = true
        eventTitle.topAnchor.constraint(equalTo: eventStartTime.topAnchor).isActive = true
        eventTitle.rightAnchor.constraint(equalTo: marginGuide.rightAnchor).isActive = true
        
        locationImage.leftAnchor.constraint(equalTo: classificationColor.rightAnchor).isActive = true
        locationImage.topAnchor.constraint(equalTo: eventTitle.bottomAnchor).isActive = true
        
        locationImage.widthAnchor.constraint(equalToConstant: 50.0)
        locationImage.heightAnchor.constraint(equalToConstant: 50.0)
        
        eventTitle.leftAnchor.constraint(equalTo: locationImage.rightAnchor).isActive = true
        eventTitle.topAnchor.constraint(equalTo: eventTitle.topAnchor).isActive = true
        eventTitle.rightAnchor.constraint(equalTo: marginGuide.rightAnchor).isActive = true
        
        eventTitle.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        eventLocation.heightAnchor.constraint(equalTo: eventStartTime.heightAnchor, multiplier: 1.0).isActive = true
        
        /*
         Label properties
         */
        eventTitle.textAlignment     = .left
        eventTitle.textColor         = .black
        eventTitle.font              =  UIFont.systemFont(ofSize: 16, weight: .regular)
        eventLocation.textAlignment  = .left
        eventLocation.textColor      = .lightGray
        eventLocation.font           =  UIFont.systemFont(ofSize: 14, weight: .light)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        eventStartTime.text = ""
        eventDuration.text  = ""
        eventTitle.text     = ""
        eventLocation.text     = ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        classificationColor.layer.cornerRadius = classificationColor.frame.size.width/2.0
    }
}
