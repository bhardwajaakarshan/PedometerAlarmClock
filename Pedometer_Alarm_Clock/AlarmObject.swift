//
//  AlarmObject.swift
//  Pedometer_Alarm_Clock
//
//  Created by Aash Bhardwaj on 7/25/16.
//  Copyright © 2016 Aash Bhardwaj. All rights reserved.
//

import Foundation

class AlarmObject {
    
    var alarms: [NSDate] = [NSDate()]
    
    static let sharedInstance = AlarmObject()
    
    func getAlarms() -> [NSDate] {
        return alarms
    }
    
}