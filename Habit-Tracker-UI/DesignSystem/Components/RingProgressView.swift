//
//  RingProgressView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 04/09/26.
//

import SwiftUI

struct RingProgressView: View {
    
    var progress: Double = 0.75
    
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(Color(.border), lineWidth: 10)
                .foregroundStyle(.blue)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.green, style:StrokeStyle(lineWidth: 10, lineCap: .round))
                .foregroundStyle(.red)
                .rotationEffect(Angle(degrees: -90))
                
                
            
            
            
        }
        
        
    }
}

#Preview {
    RingProgressView()
}
