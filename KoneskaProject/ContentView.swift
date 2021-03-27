//
//  ContentView.swift
//  KoneskaProject
//
//  Created by Yaz Burrell on 3/27/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Text("Accelerometer")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.leading)
            .padding()
            .background(Color.blue)
    }
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
