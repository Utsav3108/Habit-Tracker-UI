//
//  Extensions.swift
//  Habit-Tracker-UI
//
//  Created by Utsav Hitendrabhai Pandya on 06/09/26.
//

import Foundation

extension Double {
    
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
