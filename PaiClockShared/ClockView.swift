//
//  ClockView.swift
//  PaiClock
//
//  Created by Zerui Chen on 24/10/20.
//

import SwiftUI

fileprivate let thisBundle = Bundle(for: ClockDataSource.self)

public struct ClockView: View {
    
    public init() {
        dataSource = .init()
    }
    
    @ObservedObject public var dataSource: ClockDataSource
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                let minDim = min(proxy.size.width, proxy.size.height)
                
                Image("clock_frame", bundle: thisBundle)
                    .resizable()
                    .frame(idealWidth: minDim, maxWidth: minDim,
                           idealHeight: minDim, maxHeight: minDim)
                
                Image("clock_hand", bundle: thisBundle)
                    .resizable()
                    .frame(maxWidth: minDim, maxHeight: minDim)
                    .scaleEffect(0.8)
                    .rotationEffect(
                        Angle(degrees: dataSource.fractionOfDay * 360 - 180)
                    )
                    .animation(.easeOut)
            }
            .aspectRatio(1, contentMode: .fill)
        }
        .onAppear {
            dataSource.resume()
        }
        .onDisappear {
            dataSource.pause()
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .frame(width: 300)
    }
}
