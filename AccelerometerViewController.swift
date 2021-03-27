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
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accelertator()
    }
    
    func accelertator() {
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
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
    }

}
