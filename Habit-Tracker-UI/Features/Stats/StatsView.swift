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
                        
                        StatsFilterView(color: Color(.textPrimary), showCalendarIcon: false)
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
                StatsFilterView(color: Color(.primary))
            }
        }
    }
}

#Preview {
    StatsView()
}
