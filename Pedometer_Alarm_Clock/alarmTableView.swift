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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        table.delegate = self
        table.dataSource = self
        self.table.reloadData()
        print(AlarmObject.alarms)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        //print("NUM ELEMENTS: \(ListArray.count)")
        return AlarmObject.alarms.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 51
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()//tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        //cell.textLabel?.text = "\(ListArray[indexPath.item])"
        print(AlarmObject.alarms[indexPath.row])
        cell.textLabel?.text = String(AlarmObject.alarms[indexPath.row])
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}