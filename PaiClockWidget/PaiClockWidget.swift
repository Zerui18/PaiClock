//
//  PaiClockWidget.swift
//  PaiClockWidget
//
//  Created by Zerui Chen on 24/10/20.
//

import WidgetKit
import SwiftUI

struct EmptyEntry: TimelineEntry {
    var date: Date
    
    static var placeholder: EmptyEntry {
        EmptyEntry(date: Date())
    }
}

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> EmptyEntry {
        .placeholder
    }
    
    func getSnapshot(in context: Context, completion: @escaping (EmptyEntry) -> Void) {
        completion(.placeholder)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<EmptyEntry>) -> Void) {
        // Refersh every minute for the coming hour.
        let timeline = Timeline(entries: (0...60).map { i in
            EmptyEntry(date: Date(timeIntervalSinceNow: Double(i * 60)))
        }, policy: .atEnd)
        completion(timeline)
    }
    
}

@main
struct PaiClockWidget: Widget {
    
    let kind: String = "PaiClockWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { _ in
            ClockViewWrapper()
        }
        .configurationDisplayName("Genshin Clock")
        .description("Dynamic clock with 3 size options.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct PaiClockWidget_Previews: PreviewProvider {
    static var previews: some View {
        ClockViewWrapper()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
