//
//  ClockDataSource.swift
//  PaiClock
//
//  Created by Zerui Chen on 24/10/20.
//

import SwiftUI

public class ClockDataSource: ObservableObject {
    
    @Published var fractionOfDay = 0.0
    private var timer: Timer?
    
    public init() {
        // Initial update.
        withAnimation(nil) {
            updateFractionOfDay()
        }
    }
    
    public func resume() {
        if timer != nil {
            pause()
        }
        timer = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateFractionOfDay), userInfo: nil, repeats: true)
    }
    
    public func pause() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateFractionOfDay() {
        let startOfDay = Calendar.current.startOfDay(for: Date())
        fractionOfDay = (-startOfDay.timeIntervalSinceNow) / 86400
    }
    
    public func simulateDay() {
        pause()
        timer = .scheduledTimer(withTimeInterval: 0.5, repeats: true) { [self] _ in
            let newFraction = (fractionOfDay + 0.05)
            fractionOfDay = newFraction >= 1 ? 0:newFraction
        }
    }
    
}
