//
//  TodayView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 04/09/26.
//

import SwiftUI

struct Habit : Identifiable {
    
    var id : UUID = UUID()
    var iconName  : String
    var title     : String
    var description: String
    var isCompleted: Bool
    var color : Color

}

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
    
    @State var selectedCalendarIndex : Int = 2
    
    @State var habits : [Habit] = [
        Habit(iconName: AppIcon.workout, title: "Workout", description: "30 min exercise", isCompleted: true, color: .green),
        Habit(iconName: AppIcon.water, title: "Drink Water", description: "6 glasses a day", isCompleted: true, color: .blue),
        Habit(iconName: AppIcon.reading, title: "Read", description: "20 min reading", isCompleted: true, color: .purple),
        Habit(iconName: AppIcon.meditation, title: "Meditate", description: "10 min meditation", isCompleted: false, color: .yellow),
        Habit(iconName: AppIcon.journal, title: "Journal", description: "30 min exercise", isCompleted: false, color: .red),
    ]
    
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                // Title
                VStack(alignment: .leading){
                    Text("Habit Tracker")
                        .font(Typography.sectionTitle)
                        .foregroundStyle(Color(.textPrimary))
                    
                    Text("Build better habits, everyday")
                        .font(Typography.caption)
                        .foregroundStyle(Color(.textSecondary))
                }
                
                // Calendar
                VStack {
                    CalendarView(dates: $calendarDates) { selectedIndex in
                        
                        calendarDates[self.selectedCalendarIndex].isSelected = false
                        self.selectedCalendarIndex = selectedIndex
                        calendarDates[selectedIndex].isSelected = true
                        
                        
                    }
                }
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: Radius.medium)
                        .fill(.white)
                        
                )
                
                // Progress
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Today's Progress")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Spacer()
                        Button("", systemImage: "chevron.right") {
                            
                        }
                        .foregroundStyle(Color(.gray))
                    }
                    
                    HStack {
                        ZStack {
                            RingProgressView(progress: 0.75)
                                .frame(width: 150, height: 150)
                            
                            VStack {
                                Text("\(Text("4").font(.system(size: 24).bold())) / 5")
                                Text("Completed")
                                    .foregroundStyle(.textTertiary)
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            HStack(spacing: 12) {
                                Image(systemName: AppIcon.flame)
                                    .foregroundStyle(.green)
                                    .frame(width: 15, height: 15)
                                    .padding(10)
                                    .background(Circle().fill(Color(.green).opacity(0.05)))
                                
                                Text("12   \(Text("Day Streak").font(.caption2).foregroundStyle(.textTertiary))")
                                    .font(.headline)
                                    .fontWeight(.medium)
            
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 12) {
                                Image(systemName: AppIcon.progress)
                                    .foregroundStyle(.purple)
                                    .frame(width: 15, height: 15)
                                    .padding(10)
                                    .background(Circle().fill(Color(.purple).opacity(0.05)))
                                
                                Text("80%   \(Text("Day Streak").font(.caption2).foregroundStyle(.textTertiary))")
                                    .font(.headline)
                                    .fontWeight(.medium)
            
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 12) {
                                Image(systemName: AppIcon.star)
                                    .foregroundStyle(.yellow)
                                    .frame(width: 15, height: 15)
                                    .padding(10)
                                    .background(Circle().fill(Color(.yellow).opacity(0.05)))
                                
                                Text("34   \(Text("Total Completed").font(.caption2).foregroundStyle(.textTertiary))")
                                    .font(.headline)
                                    .fontWeight(.medium)
            
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .frame(maxHeight: 150)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: Radius.medium)
                        .fill(.white)
                        
                )
                
                // List of Habits
                VStack(alignment: .leading) {
                    
                    Text("Habits")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.textPrimary)
                    ForEach(habits.enumerated(), id: \.element.id) { (index, habit) in
                        
                        HStack {
                            HStack {
                                Image(systemName: habit.iconName)
                                    .foregroundStyle(habit.color)
                                    .frame(width: 15, height: 15)
                                    .padding(10)
                                    .background(Circle().fill(Color(habit.color).opacity(0.2)))
                                
                                VStack(alignment: .leading) {
                                    Text(habit.title)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    
                                    Text(habit.description)
                                        .font(.caption2)
                                        .fontWeight(.thin)
                                }
                                
                                
                            }
                            
                            Spacer()
                            
                            Image(systemName: habit.isCompleted ? AppIcon.select : AppIcon.unselect)
                                .resizable()
                                .frame(width: 10, height: 10)
                                .padding(6)
                                .foregroundStyle(.white)
                                .background(
                                    Circle()
                                        .fill(habit.isCompleted ? .green : .clear)
                                        .stroke(Color(.gray), lineWidth: habit.isCompleted ? 0 : 1)
                                        
                                )
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerRadius: Radius.medium)
                                .fill(.white)
                                
                        )
                        .onTapGesture {
                            habits[index].isCompleted.toggle()
                        }
                        
                    }
                }
                
                
                Spacer()
                
            }

            .padding(.horizontal, 10)
            .background(Color(.background))
            .toolbar {
                Button("", systemImage: AppIcon.add) {
                    
                }
            }
        }
        .background(Color(.background))
        
        
    }
}

#Preview {
    TodayView()
}
