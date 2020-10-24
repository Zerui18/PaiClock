//
//  PaiClockSmall.swift
//  PaiClockShared
//
//  Created by Zerui Chen on 24/10/20.
//

import SwiftUI
import WidgetKit
import PaiClockShared

struct ClockViewSmall: View {
    var body: some View {
        ZStack {
            Image("background_small")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            ClockView()
        }
    }
}

struct ClockViewSmall_Previews: PreviewProvider {
    static var previews: some View {
        ClockViewSmall()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
