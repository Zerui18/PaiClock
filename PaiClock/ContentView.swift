//
//  ContentView.swift
//  PaiClock
//
//  Created by Zerui Chen on 24/10/20.
//

import SwiftUI
import PaiClockShared

struct ContentView: View {
    var body: some View {
        ClockView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 177, height: 100))
    }
}
