//
//  Habit_Tracker_UIApp.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 03/09/26.
//

import SwiftUI
import CoreData

@main
struct Habit_Tracker_UIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
