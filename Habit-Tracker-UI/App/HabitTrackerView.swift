//
//  HabitTrackerView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 04/09/26.
//

import SwiftUI

struct HabitTrackerView: View {
    var body: some View {
        TabView {
            
            NavigationStack {
                TodayView()
                    
            }.tabItem {
                Label("Today", systemImage: AppIcon.today)
                    
            }
            
            
            NavigationStack {
                StatsView()
                    
            }.tabItem {
                Label("Stats", systemImage: AppIcon.stats)
            }
            
            NavigationStack {
                HabitsView()
                    
            }
            .tabItem {
                Label("Habits", systemImage: AppIcon.habits)
            }
            
            NavigationStack {
                ProfileView()
                    
            }.tabItem {
                Label("Profile", systemImage: AppIcon.profile)
            }
            
            
        }
    }
}

#Preview {
    HabitTrackerView()
}
