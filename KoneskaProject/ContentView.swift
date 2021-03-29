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
                        Text(String(format: "%.3f", self.motionLogger.xLabel))
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Text(String(format: "%.3f", self.motionLogger.yLabel))
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Text(String(format: "%.3f", self.motionLogger.yLabel))
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
                    HStack {
                        Button(action: {
                            self.startLogging.toggle()
                            
                            
                        }, label: {
                            Image(systemName: "pause.circle")
                            Text("Stop")
                        })
                    }
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
