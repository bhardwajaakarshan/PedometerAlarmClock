//
//  AlarmCreationViewController.swift
//  Pedometer_Alarm_Clock
//
//  Created by Aash Bhardwaj on 7/25/16.
//  Copyright © 2016 Aash Bhardwaj. All rights reserved.
//

import Foundation
import UIKit

class AlarmCreationViewController: UIViewController, UIPickerViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func addAlarm(sender: UIButton) {
        let selectedValue = self.datePicker.date
        let alert = UIAlertController()
        alert.title = "Alarm Added"
        alert.message = "\(selectedValue)"
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        //addNewAlarm(selectedValue)
    }
    
}