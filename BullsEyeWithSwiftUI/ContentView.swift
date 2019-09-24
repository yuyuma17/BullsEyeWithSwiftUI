//
//  ContentView.swift
//  BullsEyeWithSwiftUI
//
//  Created by 黃士軒 on 2019/9/19.
//  Copyright © 2019 Lacie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var targetValue = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        VStack {
            
            Spacer()
            HStack {
                Text("Put the Bull's Eye as close as you can to:").allowsTightening(true)
                Text("\(targetValue)")
            }
            Spacer()
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
                
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                
                let message = Text("The slider's value is \(sliderValueRounded()).\n" + "You scored \(pointsForCurrentRound()) points this round.")
                let dismissButtonTitle = Text("Next round")
                let dismissButton = Alert.Button.default(dismissButtonTitle) {
                    self.score = self.score + self.pointsForCurrentRound()
                    self.targetValue = Int.random(in: 1...100)
                    self.round = self.round + 1
                    self.sliderValue = 50.0
                }
                
                return Alert(title: Text(alertTitle()), message: message, dismissButton: dismissButton)
            }
            
            Spacer()
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                NavigationLink(destination: AboutView()) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        .navigationBarTitle("Bull's eye")
        }
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = abs(targetValue - sliderValueRounded())
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = 100 - abs(targetValue - sliderValueRounded())
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        targetValue = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}


