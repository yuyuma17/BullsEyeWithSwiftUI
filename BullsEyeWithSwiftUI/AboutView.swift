//
//  AboutView.swift
//  BullsEyeWithSwiftUI
//
//  Created by 黃士軒 on 2019/9/24.
//  Copyright © 2019 Lacie. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("🎯Bull's Eye🎯")
            Text("This is Bull's Eye, the game where you can win points and earn fame by dragging a slider.")
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.")
            Text("Enjoy!")
        }
    .navigationBarTitle("Bull's eye")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
