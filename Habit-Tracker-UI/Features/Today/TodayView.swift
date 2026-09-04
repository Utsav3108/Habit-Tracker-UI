//
//  TodayView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 04/09/26.
//

import SwiftUI

struct TodayView: View {
    
    @State var calendarDates : [CalendarData] = [
        CalendarData(day: "MON", date: 26, isCompleted: true),
        CalendarData(day: "TUE", date: 27, isCompleted: true),
        CalendarData(day: "WED", date: 28, isCompleted: false, isSelected: true),
        CalendarData(day: "THU", date: 29, isCompleted: false),
        CalendarData(day: "FRI", date: 30, isCompleted: false),
        CalendarData(day: "SAT", date: 31, isCompleted: false),
        CalendarData(day: "SUN", date: 01, isCompleted: false)
    ]
    
    @State var selectedIndex : Int = 2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            VStack(alignment: .leading){
                Text("Habit Tracker")
                    .font(Typography.sectionTitle)
                    .foregroundStyle(Color(.textPrimary))
                
                Text("Build better habits, everyday")
                    .font(Typography.caption)
                    .foregroundStyle(Color(.textSecondary))
            }
            
            CalendarView(dates: $calendarDates) { selectedIndex in
                
                calendarDates[self.selectedIndex].isSelected = false
                self.selectedIndex = selectedIndex
                calendarDates[selectedIndex].isSelected = true
                
                
            }
            Spacer()
            
        }
        .padding(.horizontal, 10)
        .toolbar {
            Button("", systemImage: AppIcon.add) {
                
            }
        }
        
        
    }
}

#Preview {
    TodayView()
}
