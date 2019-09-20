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
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Hello world")
            }
            
            Button(action: {
                print("YES")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
                
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                let title = Text("Hello")
                let dismissButtonTitle = Text("OK")
                let message = Text("You are good")
                let dismissButton = Alert.Button.default(dismissButtonTitle)
                return Alert(title: title, message: message, dismissButton: dismissButton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


