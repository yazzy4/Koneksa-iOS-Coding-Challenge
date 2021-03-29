//
//  AccelerometerMonitor.swift
//  KoneskaProject
//
//  Created by Yaz Burrell on 3/29/21.
//

import Foundation
import CoreMotion
import Combine
import SwiftUI

class AccelerometerMonitor: NSObject, ObservableObject {
    var motionManager: CMMotionManager?
    
    var data = PhoneSensorData()
    
    @Published var xlabel = 0.0
    @Published var ylabel = 0.0
    @Published var zlabel = 0.0

    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var counter = 0.0
    
    override init() {
        super.init()
        self.motionManager = CMMotionManager()
    }
    
   @objc func startMotionSensor() {
        if let data = motionManager?.accelerometerData {
            let x = data.acceleration.x
            let y = data.acceleration.y
            let z = data.acceleration.z
          
            self.xlabel = x
            self.ylabel = y
            self.zlabel = z

        }
        
        //Add to start button in counter conditional, change button value when complete
        func stopMotionSensor(){
//            self.timer.upstream.connect().cancel()
            if self.motionManager!.isAccelerometerActive {
                self.motionManager?.stopAccelerometerUpdates()
            }
        }
    }
    
}
