//
//  AccelerometerViewController.swift
//  KoneskaProject
//
//  Created by Yaz Burrell on 3/27/21.
//

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {
    
    var xlabel: UILabel!
    var ylabel: UILabel!
    var zlabel: UILabel!
    
    var motionManager = CMMotionManager()
    var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerActivated), userInfo: nil, repeats: true)
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accelertator()
    }
    
    @objc func timerActivated(timer: Timer) {
        print("Timer activated!")
        count += 1
        
        if count == 10 {
            timer.invalidate()
        }
    }
    
 
    
    func accelertator() {
        timerActivated(timer: timer)
        motionManager.accelerometerUpdateInterval = 0.5
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            print(data as Any)
            if let data = data {
                self.view.reloadInputViews()
                let x = data.acceleration.x
                let y = data.acceleration.y
                let z = data.acceleration.z
                self.xlabel.text = "x: \(Double(x))"
                self.ylabel.text = "y: \(Double(y))"
                self.zlabel.text = "z: \(Double(z))"
 
            }
        }
        motionManager.stopAccelerometerUpdates()
    }

}
