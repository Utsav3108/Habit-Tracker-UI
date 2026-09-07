//
//  StatsView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 04/09/26.
//

import SwiftUI
import Charts

struct DailyHabitCompletion: Identifiable {
    let id = UUID()
    let day: String
    let percentage: Double
}

struct Overview : Identifiable {
    
    var id : UUID = UUID()
    
    var imageName : String
    var tintColor : Color
    
    var value : String
    
    var desc : String
    
}


struct StatsView: View {
    
    
    var overviews : [Overview] = [
        .init(imageName: "checkmark.circle.fill", tintColor: Color(.green), value: "85%", desc: "Overall Completion"),
        .init(imageName: AppIcon.flame, tintColor: Color(.primary), value: "12", desc: "Day Streak"),
        .init(imageName: AppIcon.star, tintColor: Color(.yellow), value: "48", desc: "Total Completed"),
        .init(imageName: AppIcon.progress, tintColor: Color(.blue), value: "+24%", desc: "Improvement vs Last Week")

    ]
    
    var habitCompletions = [
        DailyHabitCompletion(day: "Mon", percentage: 75),
        DailyHabitCompletion(day: "Tue", percentage: 100),
        DailyHabitCompletion(day: "Wed", percentage: 50),
        DailyHabitCompletion(day: "Thu", percentage: 80),
        DailyHabitCompletion(day: "Fri", percentage: 90),
        DailyHabitCompletion(day: "Sat", percentage: 60),
        DailyHabitCompletion(day: "Sun", percentage: 40)
    ]
    
    var weeklyHabitsPerformance : [HabitPerformance] {[
        
        HabitPerformance(iconName: AppIcon.workout, habitName: "Workout", desc: "30 min exercise", tintColor: .green, performance: workOutPerformances),
        HabitPerformance(iconName: AppIcon.water, habitName: "Drink Water", desc: "8 glasses a day", tintColor: .blue, performance: drinkPerformances),
        HabitPerformance(iconName: AppIcon.reading, habitName: "Read", desc: "20 min reading", tintColor: Color(.primary), performance: readingPerformances),
        HabitPerformance(iconName: AppIcon.meditation, habitName: "Meditation", desc: "10 min meditation", tintColor: .yellow, performance: meditationPerformances),
        
        
    ]}
    
    let workOutPerformances = [
        WeekPerformace(day: "M", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: true),
        WeekPerformace(day: "W", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: true),
        WeekPerformace(day: "F", isCompleted: true),
        WeekPerformace(day: "S", isCompleted: true),
        WeekPerformace(day: "S", isCompleted: true),
    ]
    
    let drinkPerformances = [
        WeekPerformace(day: "M", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: true),
        WeekPerformace(day: "W", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: true),
        WeekPerformace(day: "F", isCompleted: true),
        WeekPerformace(day: "S", isCompleted: false),
        WeekPerformace(day: "S", isCompleted: false),
    ]
    
    let readingPerformances = [
        WeekPerformace(day: "M", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: true),
        WeekPerformace(day: "W", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: true),
        WeekPerformace(day: "F", isCompleted: false),
        WeekPerformace(day: "S", isCompleted: false),
        WeekPerformace(day: "S", isCompleted: false),
    ]
    
    let meditationPerformances = [
        WeekPerformace(day: "M", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: true),
        WeekPerformace(day: "W", isCompleted: true),
        WeekPerformace(day: "T", isCompleted: false),
        WeekPerformace(day: "F", isCompleted: false),
        WeekPerformace(day: "S", isCompleted: false),
        WeekPerformace(day: "S", isCompleted: false),
    ]
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                TitleView(title: "Stats", subtitle: "Track your progress and stay motivated.")
                
                // Overview
                VStack(alignment: .leading, spacing: 15) {
                    Text("Overview")
                        .font(.footnote)
                        .fontWeight(.bold)
                    
                    
                    HStack(alignment: .top) {
                        
                        ForEach(overviews) { overview in
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 10) {
                                
                                AppTintIcon(tintColor: overview.tintColor, image: Image(systemName: overview.imageName))
                                
                                Text(overview.value)
                                    .font(.headline.bold())
                                
                                Text(overview.desc)
                                    .font(.caption)
                                    .foregroundStyle(Color(.textTertiary))
                                    .multilineTextAlignment(.center)
                                
                                
                            }
                            
                            Spacer()
                        
                        }
                        
                    }
                    
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: Radius.medium)
                        .fill(.white)
                        
                )
                
                // Completion Rate
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        
                        Text("Completion Rate")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.textPrimary))
                        
                        Spacer()
                        
                        StatsFilterView(text: "This Week", color: Color(.textPrimary), showCalendarIcon: false)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 5)
                            .background(RoundedRectangle(cornerRadius: Radius.small).stroke(.gray.opacity(0.2), lineWidth: 1))
                        
                        
                    }
                    
                    Chart(
                        habitCompletions.enumerated(),
                        id: \.element.id
                    ) { index, item in

                        let minimumOpacity = 0.6
                        let maximumOpacity = 1.0

                        let progress = Double(index)
                            / Double(habitCompletions.count - 1)

                        let opacity = maximumOpacity
                            - (progress * (maximumOpacity - minimumOpacity))

                        BarMark(
                            x: .value("Day", item.day),
                            y: .value("Percentage", item.percentage)
                        )
                        .foregroundStyle(
                            Color(.primary)
                                .opacity(opacity)
                        )
                        .cornerRadius(Radius.xsmall)
                    }
                    .chartYScale(domain: 0...100)
                    .chartYAxis {
                        AxisMarks(
                            position: .leading,
                            values: [0, 25, 50, 75, 100]
                        ) { value in

                            AxisGridLine(
                                stroke: StrokeStyle(
                                    lineWidth: 1,
                                    dash: [4, 4]
                                )
                            )
                            .foregroundStyle(.gray.opacity(0.1))

                            AxisValueLabel {
                                if let percentage = value.as(Int.self) {
                                    Text("\(percentage)%")
                                }
                            }
                        }
                    }
                    .chartXAxis {
                        AxisMarks { value in
                            AxisValueLabel()
                        }
                    }
                    
                }
                .frame(height: 200)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: Radius.medium)
                        .fill(.white)
                        
                )
                
                // Performance
                VStack(alignment: .leading) {
                    HStack {
                        
                        Text("Habit Performance")
                            .font(.footnote.bold())
                        
                        Spacer()
                        
                        StatsFilterView(text: "View All", color: Color(.primary), showCalendarIcon: false, showDropDownIcon: false)
                        
                        
                    }
                    
                    ForEach(weeklyHabitsPerformance.enumerated(), id: \.element.id) { (index, habitPerformance) in
                        
                        VStack(alignment: .leading) {
                            
                            GeometryReader { geometry in
                                
                                let width = geometry.size.width
                                
                                HStack {
                                    
                                    // Column 1 — Habit
                                    HStack {
                                        Image(systemName: habitPerformance.iconName)
                                            .foregroundStyle(habitPerformance.tintColor)
                                            .padding(8)
                                            .frame(width: 40, height: 40, alignment: .center)
                                            .background(RoundedRectangle(cornerRadius: Radius.small).fill(habitPerformance.tintColor.opacity(0.1)))

                                        
                                        
                                        VStack(alignment: .leading) {
                                            Text(habitPerformance.habitName)
                                                .font(.footnote.bold())
                                            Text(habitPerformance.desc)
                                                .font(.caption2)
                                                .foregroundStyle(.gray)
                                        }
                                        
                                        
                                    }
                                    .frame(
                                        width: width * 0.40,
                                        alignment: .leading
                                    )
                                    
                                        
                                    // Column 2 — Weekly performance
                                    WeekPerformanceView(performances: habitPerformance.performance, padding: 3, tintColor: habitPerformance.tintColor)
                                        
                                    
                                   
                                    
                                    // Column 3 — Percentage
                                    Text("\(habitPerformance.percentage, specifier: "%.0f")%")
                                        .font(.footnote.bold())
                                        .foregroundStyle(habitPerformance.tintColor)
                                        .frame(width: 50, alignment: .center)
                                        
                                
                                    
                                }
                                
                            }
                                
                            
                            
                            
                            if index < weeklyHabitsPerformance.count - 1 {
                            
                                Divider()
                            }
                        }
                        .frame(height: 50)
                            
                        
                        
                    }
                    
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: Radius.medium)
                        .fill(.white)
                        
                )
                
                Spacer()
                
            }
            .padding(10)

        }
        .background(Color(.background))
        .toolbar {
            Button {
                
            } label: {
                StatsFilterView(text: "This Week", color: Color(.primary))
            }
        }
    }
}

#Preview {
    StatsView()
}
