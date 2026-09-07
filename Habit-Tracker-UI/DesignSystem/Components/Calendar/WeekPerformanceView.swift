//
//  WeekPerformanceView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 06/09/26.
//

import SwiftUI

struct HabitPerformance : Identifiable {
    var id : UUID = UUID()
    var iconName : String
    var habitName : String
    var desc : String
    var tintColor : Color
    var performance : [WeekPerformace]
    
    var percentage : Double {
        let result = Double(performance.filter(\.isCompleted).count) / Double(performance.count) * 100
        
        return result.rounded(toPlaces: 2)
    }
}

struct WeekPerformace : Identifiable {
    var id : UUID = UUID()
    var day : String
    var isCompleted : Bool
    
}

struct WeekPerformanceView: View {
    
    var performances : [WeekPerformace]
    var padding : CGFloat = 4
    var tintColor : Color
    
    var body: some View {
        
        HStack {
            
            ForEach(performances) { performance in
                
                VStack(spacing: 2) {
                    Image(systemName: performance.isCompleted ? AppIcon.select : AppIcon.unselect)
                        
                        .font(.system(size: 8))
                        .frame(width: 10, height: 10)
                        .padding(padding)
                        .foregroundStyle(.white)
                        .background(Circle()
                            .stroke(.gray.opacity(0.5), lineWidth: performance.isCompleted ? 0 : 1)
                            .fill(
                            
                            performance.isCompleted ? tintColor : .clear
                            
                        ))
                    
                    Text(performance.day)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, minHeight: 20)
                
                
                
            }
            
        }
        
        
        
    }
}

#Preview {
    let performances = [
        WeekPerformace(day: "M", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: true),
        WeekPerformace(day: "W", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: false),
        WeekPerformace(day: "F", isCompleted: false),
        WeekPerformace(day: "S", isCompleted: false),
        WeekPerformace(day: "S", isCompleted: false),
    ]
    WeekPerformanceView(performances: performances, tintColor: .green)
}
