//
//  TitleView.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 05/09/26.
//

import SwiftUI

struct TitleView: View {
    
    var title : String
    
    var subtitle : String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(Typography.sectionTitle)
                .foregroundStyle(Color(.textPrimary))
            
            Text(subtitle)
                .font(Typography.caption)
                .foregroundStyle(Color(.textSecondary))
        }
    }
}

#Preview {
    TitleView(title: "Habit Tracker", subtitle: "")
}
