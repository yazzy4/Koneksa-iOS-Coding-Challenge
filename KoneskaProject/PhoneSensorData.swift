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
    
    func append(time: String, x: Double, y: Double, z: Double ) {
        var end = "\(time) ,"
        end.append("\(x) ,")
        end.append("\(y) ,")
        end.append("\(z) ,")
    }
    
    func getAccelFilePathURLs(label: String, type: String) -> [URL]{
        let format = DateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        let time = format.string(from: Date())
        
        let tempPath = NSHomeDirectory() + "tmp"
        
        let apd = "\(time)_\(label)_\(type)"
        
        let accelFilePath = tempPath + "//accelermeter_\(apd).csv"
        
        do {
            try self.accelerometerData.write(toFile: accelFilePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to write file\(error)")
        }
        
        
        var url = [URL]()
        url.append(URL(fileURLWithPath: accelFilePath))
        
        return url
    }
    
    mutating func dataReset() {
        self.accelerometerData = self.xyzColumns
    }
    
}
