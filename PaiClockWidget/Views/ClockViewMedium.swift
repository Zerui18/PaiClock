//
//  PaiClockMedium.swift
//  PaiClockShared
//
//  Created by Zerui Chen on 24/10/20.
//

import SwiftUI
import WidgetKit
import PaiClockShared

struct ClockViewMedium: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            
            Image("background_medium")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.1)
            
            ClockView()
        }
    }
}

struct ClockViewMediumPreviews: PreviewProvider {
    static var previews: some View {
        ClockViewMedium()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
