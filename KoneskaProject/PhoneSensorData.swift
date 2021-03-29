//
//  PhoneSensorData.swift
//  KoneskaProject
//
//  Created by Yaz Burrell on 3/29/21.
//

import Foundation

struct PhoneSensorData {
    var accelerometerData: String
    let xyzColumns = "time,x,y,z\n"
    
    init(){
        self.accelerometerData = self.xyzColumns
    }
    
}
