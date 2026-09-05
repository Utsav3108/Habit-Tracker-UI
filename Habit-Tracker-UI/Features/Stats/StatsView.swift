//
//  StatsView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 04/09/26.
//

import SwiftUI



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
        .init(imageName: AppIcon.star, tintColor: Color(.yellow), value: "+24%", desc: "Total Completed"),
        .init(imageName: AppIcon.progress, tintColor: Color(.blue), value: "+24%", desc: "Improvement vs Last Week")

    ]
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                TitleView(title: "Stats", subtitle: "Track your progress and stay motivated.")
                
                
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
