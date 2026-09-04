//
//  Typography.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 03/09/26.
//
import Foundation
import SwiftUI

enum Typography {

    // MARK: Titles
    static let largeTitle = Font.system(size: 34, weight: .bold)
    static let sectionTitle = Font.system(size: 22, weight: .semibold)
    static let cardTitle = Font.system(size: 18, weight: .semibold)

    // MARK: Body
    static let body = Font.system(size: 16, weight: .regular)
    static let bodyMedium = Font.system(size: 16, weight: .medium)

    // MARK: Buttons & Labels
    static let button = Font.system(size: 16, weight: .semibold)
    static let smallLabel = Font.system(size: 13, weight: .medium)

    // MARK: Statistics
    static let largeStatistic = Font.system(size: 34, weight: .bold)
    static let statistic = Font.system(size: 28, weight: .bold)

    // MARK: Secondary
    static let secondary = Font.system(size: 14, weight: .regular)
    static let caption = Font.system(size: 12, weight: .regular)
    static let navigation = Font.system(size: 12, weight: .medium)
}
