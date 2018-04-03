//
//  UIColor+HexExtension.swift
//  calendarapp
//
//  Created by Keshava Karthik on 31/03/18.
//  Copyright © 2018 Keshava Karthik S. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
}
