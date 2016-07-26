//
//  alarmTableView.swift
//  Pedometer_Alarm_Clock
//
//  Created by Aash Bhardwaj on 7/25/16.
//  Copyright © 2016 Aash Bhardwaj. All rights reserved.
//

import Foundation
import UIKit

class alarmTableView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    
    var ListArray = AlarmObject.sharedInstance.alarms
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        print("NUM ELEMENTS: \(ListArray.count)")
        return ListArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 51
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        //cell.titleLabel.text = "\(ListArray.objectAtIndex(indexPath.item))"
        print(ListArray[indexPath.row])
        cell.textLabel!.text! = String(ListArray[indexPath.row])
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}