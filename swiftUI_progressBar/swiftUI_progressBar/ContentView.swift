//
//  ContentView.swift
//  swiftUI_progressBar
//
//  Created by Apple Cheeseboy on 9/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var downloadAmount = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let lightPurple = Color(red: 156/255, green: 16/255, blue: 179/255)
    let darkPurple = Color(red: 11/255, green: 13/255, blue: 50/255)
    let lightTeal = Color(red: 6/256, green: 243/256, blue: 232/256)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [darkPurple, lightPurple]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            
            ProgressView("", value: downloadAmount, total: 100)
                .accentColor(lightTeal)
                .scaleEffect(x: 1, y: 4, anchor: .center)
                .padding()
        }
        .onReceive(timer) { _ in
            
            if downloadAmount >= 80 {
                self.timer.upstream.connect().cancel()
            }
            
            if downloadAmount < 100 {
                downloadAmount += Double.random(in: 0.001...4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
