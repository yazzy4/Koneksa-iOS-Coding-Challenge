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

func getTimeStamp() -> String {
    let format = DateFormatter()
    format.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
    return format.string(from: Date())
}

class AccelerometerMonitor: NSObject, ObservableObject {
    var motionManager: CMMotionManager?
    
    var data = PhoneSensorData()
    
    @Published var xLabel = 0.0
    @Published var yLabel = 0.0
    @Published var zLabel = 0.0

    private var timer = Timer()
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
          
            self.xLabel = x
            self.yLabel = y
            self.zLabel = z
 
        }
    
    let timeStamp = getTimeStamp()
    
    self.data.append(time: timeStamp, x: self.xLabel, y: self.yLabel, z: self.zLabel)
    }
    
    func startUpdate(_ freq: Double) {
        if self.motionManager!.isAccelerometerAvailable {
            self.motionManager?.startAccelerometerUpdates()
        }
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startMotionSensor), userInfo: nil, repeats: true)
    }
        
        //Add to start button in counter conditional, change button value when complete
        func stopMotionSensor(){
            self.timer.invalidate()
            if self.motionManager!.isAccelerometerActive {
                self.motionManager?.stopAccelerometerUpdates()
            }
        }
    }
    

