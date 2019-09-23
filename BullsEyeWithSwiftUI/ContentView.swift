//
//  ContentView.swift
//  BullsEyeWithSwiftUI
//
//  Created by 黃士軒 on 2019/9/19.
//  Copyright © 2019 Lacie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            
            Spacer()
            HStack {
                Text("Put the Bull's Eye as close as you can to:").allowsTightening(true)
                Text("100")
            }
            Spacer()
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            Button(action: {
                print("YES")
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
                
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                var roundedValue = Int(sliderValue.rounded())
                let title = Text("Hello")
                let message = Text("The slider's value is \(roundedValue)")
                let dismissButtonTitle = Text("OK")
                let dismissButton = Alert.Button.default(dismissButtonTitle)
                
                return Alert(title: title, message: message, dismissButton: dismissButton)
            }
            
            Spacer()
            HStack {
                Button(action: {
                    
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("0")
                Spacer()
                Text("Round:")
                Text("1")
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}


