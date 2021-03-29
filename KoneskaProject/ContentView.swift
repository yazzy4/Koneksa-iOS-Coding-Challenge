//
//  ContentView.swift
//  KoneskaProject
//
//  Created by Yaz Burrell on 3/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var startLogging = false
    @State private var timeCounter = 0
    
    @ObservedObject var motionLogger = AccelerometerMonitor()

    var body: some View {
        VStack {
            Text("ACCELEROMETER")
                .font(.largeTitle)
                .fontWeight(.heavy)
            HStack {
                
                VStack {
               
                    HStack {
                        Text(String(format: "%.3f", self.motionLogger.xlabel))
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Text(String(format: "%.3f", self.motionLogger.ylabel))
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Text(String(format: "%.3f", self.motionLogger.ylabel))
                            .multilineTextAlignment(.leading)
                    }.padding()
                    HStack {
                        Text("X")
                            .font(.title2)
                        Spacer()
                        Text("Y")
                            .font(.title2)
                        Spacer()
                        Text("Z")
                            .font(.title2)
                    }.padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
