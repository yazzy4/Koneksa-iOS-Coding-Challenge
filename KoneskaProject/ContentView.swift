//
//  ContentView.swift
//  KoneskaProject
//
//  Created by Yaz Burrell on 3/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var loggingStarted = false
    @State private var isActivityLabelEmpty = false
    @State private var isSharePresented = false
    @State private var timeCounter = 0
    @State private var activityLabel = ""
    
    @ObservedObject var motionLogger = AccelerometerMonitor()
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 3104)

    var body: some View {
        VStack {
            Text("ACCELEROMETER")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
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
                            .padding()
                    }
                    .padding()
            }
            VStack{
                HStack{
                    TextField("Activity Name", text: $activityLabel)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
            }
                    HStack {
                        Button(action: {
                            self.loggingStarted.toggle()
                            
                            let feedback = UIImpactFeedbackGenerator(style: .light)
                            feedback.impactOccurred()
                            
                            if self.loggingStarted {
                                self.backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
                                
                                var samplingFrequency = UserDefaults.standard.integer(forKey: "frequency_preference")
                                
                                print("sampling frequency:  \(samplingFrequency)")
                                
                                if samplingFrequency == 0 {
                                    samplingFrequency == 50
                                }
                                
                                self.motionLogger
                                    .startUpdate(Double(samplingFrequency))
                            }
                            else {
                                self.motionLogger.stopMotionSensor()
                                UIApplication.shared.endBackgroundTask(self.backgroundTaskID)
                            }
                            
                        }) {
                            if self.loggingStarted {
                                HStack {
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
                        }
                        .padding(.trailing)
                    Button(action: {
                        if self.activityLabel.count == 0  {
                            self.isActivityLabelEmpty = true
                            self.isSharePresented = false
                                    //Error handling with notification
                                    let errorFeedback = UINotificationFeedbackGenerator()
                                    errorFeedback.notificationOccurred(.error)
                                }
                                else {
                                    self.isActivityLabelEmpty = false
                                    self.isSharePresented = true
                                }
                            }) {
                                HStack {
                                    Image(systemName: "square.and.arrow.up")
                                    Text("Save")
                                }
                            }
                            .sheet(isPresented: $isSharePresented, content: {
                                ActivityViewController(activityItems: self.motionLogger.data.getAccelFilePathURL(label: self.activityLabel), applicationActivities: nil)
                            })
                            .alert(isPresented: $isActivityLabelEmpty, content: {
                                Alert(title: Text("Save unavailable"), message: Text("Please enter title or activity"))
                            }).padding()

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
