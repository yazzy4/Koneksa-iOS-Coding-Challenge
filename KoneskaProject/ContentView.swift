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
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 3104)

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
                            if self.timeCounter == 0 {
                                
                            }
                        }, label: {
                            Spacer()
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Save")
                            }
                            
                        })
                Spacer()
                Spacer()
                Spacer()
                        HStack {
                        Button(action: {
                            self.startLogging.toggle()
                            
                            let feedback = UIImpactFeedbackGenerator(style: .medium)
                            feedback.impactOccurred()
                            
                            if self.startLogging {
                                self.backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
                                
                                var samplingFrequency = UserDefaults.standard.integer(forKey: "frequency_preference")
                                
                                print("sampling frequency = \(samplingFrequency)")
                                
                                if samplingFrequency == 0 {
                                    samplingFrequency = 50
                                }
                                
                                self.motionLogger
                                    .startUpdate(Double(samplingFrequency))
                            }
                            else {
                                self.motionLogger.stopMotionSensor()
                                UIApplication.shared.endBackgroundTask(self.backgroundTaskID)
                            }
                        }) {
                            if self.startLogging {
                                HStack{
                                Image(systemName: "pause.circle")
                                Text("Stop")
                                }
                            }
                            else {
                                HStack{
                                    Image(systemName: "play.circle")
                                    Text("Start")
                                }
                            }
                        
                        Spacer()
                        }
                       
                    }
                    
                }

            }
        }
    }
}

struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
            return controller
        }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}
