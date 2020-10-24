//
//  PaiClockWidgetView.swift
//  PaiClockShared
//
//  Created by Zerui Chen on 24/10/20.
//

import SwiftUI
import WidgetKit

struct ClockViewWrapper: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            ClockViewSmall()
        case .systemMedium:
            ClockViewMedium()
        case .systemLarge:
            ClockViewLarge()
        @unknown default:
            ClockViewSmall()
        }
    }
}

struct ClockViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ClockViewWrapper()
    }
}
