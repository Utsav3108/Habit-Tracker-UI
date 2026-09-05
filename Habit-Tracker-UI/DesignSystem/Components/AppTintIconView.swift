//
//  AppTintIcon.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 05/09/26.
//

import SwiftUI

struct AppTintIcon: View {
    
    var tintColor: Color = .green
    var image : Image
    
    var body: some View {
        image
            .foregroundStyle(tintColor)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: Radius.small).fill(tintColor.opacity(0.1)))
        
    }
}

#Preview {
    AppTintIcon(image: Image(systemName: "checkmark.circle.fill"))
}
