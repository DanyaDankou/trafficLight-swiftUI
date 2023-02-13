//
//  ContentView.swift
//  trafficLight
//
//  Created by comp on 12.02.23.


import SwiftUI

struct TrafficLight: View {
    @State private var isRedOn = false
    @State private var isYellowOn = false
    @State private var isGreenOn = false
    @State private var isButtonTapped = false
    @State private var isStopped = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(isRedOn ? Color.red : Color(red: 1, green: 0, blue: 0, opacity: 0.3))
                    .frame(width: 100, height: 100)
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 100, height: 100)
            }
            .padding(.bottom, 10)
            
            ZStack {
                Circle()
                    .fill(isYellowOn ? Color.yellow : Color(red: 1, green: 1, blue: 0, opacity: 0.3))
                    .frame(width: 100, height: 100)
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 100, height: 100)
            }
            .padding(.bottom, 10)
            
            ZStack {
                Circle()
                    .fill(isGreenOn ? Color.green : Color(red: 0, green: 1, blue: 0, opacity: 0.3))
                    .frame(width: 100, height: 100)
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 100, height: 100)
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 10)
        .onTapGesture {
            self.isButtonTapped.toggle()
            if self.isButtonTapped && !self.isStopped {
                self.start()
            } else {
                self.isStopped = false
                self.isRedOn = false
                self.isYellowOn = false
                self.isGreenOn = false
            }
        }
    }
    
    func start() {
        isRedOn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.isRedOn = true
            self.isYellowOn = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isRedOn = false
                self.isYellowOn = false
                self.isGreenOn = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.isGreenOn = false
                    self.isYellowOn = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.isYellowOn = false
                        if !self.isStopped {
                            self.start()
                        }
                    }
                }
            }
        }
    }
}

struct TrafficLight_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLight()
    }
}
