//
//  ViewController.swift
//  Pedometer_Alarm_Clock
//
//  Created by Aash Bhardwaj on 7/24/16.
//  Copyright © 2016 Aash Bhardwaj. All rights reserved.
//

import UIKit
import Foundation
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var stepsToGo: UILabel!
    var currSteps = 0
    let totalSteps = 100
    var didUserWalkEnoughSteps = false
    var pedEvent = CMPedometer()
    var date = NSDate()
    let lengthFormatter = NSLengthFormatter()
    
    @IBOutlet weak var stepDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        stepDisplay.text! = String(totalSteps - currSteps)
        registerLocal(self)
        
        let _ = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(ViewController.startCounting), userInfo: nil, repeats: true)
        date = NSDate()
        if(CMPedometer.isStepCountingAvailable()){
            
            pedEvent.startPedometerUpdatesFromDate(NSDate(), withHandler: { data, error in
                //print(data!.numberOfSteps)
                self.currSteps = data!.numberOfSteps.integerValue
                //self.stepDisplay.text! = String(self.totalSteps - self.currSteps)
                
            })
        }
    }
    
    func updateColors(sender: Bool){
        if sender {
            self.view.backgroundColor = UIColor.greenColor()
            stepsToGo.textColor = UIColor.whiteColor()
            stepDisplay.textColor = UIColor.whiteColor()
        } else {
            self.view.backgroundColor = UIColor.redColor()
            stepsToGo.textColor = UIColor.blackColor()
            stepDisplay.textColor = UIColor.blackColor()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerLocal(sender: AnyObject) {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }
    
    func scheduleLocal(sender: AnyObject) {
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func resetSteps() {
        // localdata is used to access the information outside of the closure
        if(CMPedometer.isStepCountingAvailable()){
            var localdata:CMPedometerData!
            self.pedEvent.queryPedometerDataFromDate(date, toDate: NSDate(), withHandler: { data, error in
                localdata = data!
            })
            sleep(1)
            // since a second thread is created sleep is used to make sure the local value is not dereferenced before the app returns the number of steps.
            //print("\(localdata.numberOfSteps)")
            currSteps = (localdata!.numberOfSteps).integerValue
        } else {
            print("No permission to use health data.")
        }
        
        
    }
    
    func startCounting () {
        resetSteps()
        stepDisplay.text! = String(totalSteps - currSteps)
        didUserWalkEnoughSteps = (totalSteps - currSteps > 0 ? false : true)
        updateColors(didUserWalkEnoughSteps)
        if (totalSteps - currSteps < 0) {
            stepDisplay.text! = "0"
        }
    }
    
}