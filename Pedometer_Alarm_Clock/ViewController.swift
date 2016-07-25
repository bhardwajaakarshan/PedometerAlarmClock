//
//  ViewController.swift
//  Pedometer_Alarm_Clock
//
//  Created by Aash Bhardwaj on 7/24/16.
//  Copyright © 2016 Aash Bhardwaj. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var currSteps = 0
    var pedEvent = CMPedometer()
    var date = NSDate()
    let lengthFormatter = NSLengthFormatter()
    
    @IBOutlet weak var stepDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepDisplay.text! = String(currSteps)
        print("LOL")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetSteps(sender: UIButton) {

        if(CMPedometer.isStepCountingAvailable()){
            print("WE HAVE PERMISSION")
            
            self.pedEvent.startPedometerUpdatesFromDate(NSDate(), withHandler: { data, error in
                print(data!.numberOfSteps)
            })

            self.pedEvent.queryPedometerDataFromDate(date, toDate: NSDate(), withHandler: { data, error in
                print(data!.numberOfSteps)
            })
        }
        
        
    }
    
}