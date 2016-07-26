//
//  Cell.swift
//  Pedometer_Alarm_Clock
//
//  Created by Aash Bhardwaj on 7/25/16.
//  Copyright © 2016 Aash Bhardwaj. All rights reserved.
//

import Foundation
import UIKit

class Cell: UITableViewCell{
    
    
    @IBOutlet weak var lText: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.blueColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}