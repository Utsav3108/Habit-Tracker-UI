//
//  FilterView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 05/09/26.
//

import SwiftUI

struct StatsFilterView: View {
    
    var color : Color = Color(.primary)
    
    var showCalendarIcon : Bool = true
    
    var body: some View {
        HStack {
            
            if showCalendarIcon {
                Image(systemName: AppIcon.calendar)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(color)
            }
                
            
            Text("This Week")
                .font(.caption.bold())
                .foregroundStyle(color)
            
            Image(systemName: "chevron.down")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(color)
            
        }
        
        .background(
            RoundedRectangle(cornerRadius: Radius.small)
                .fill(.white)
        )
        
    }
}

#Preview {
    StatsFilterView()
}
