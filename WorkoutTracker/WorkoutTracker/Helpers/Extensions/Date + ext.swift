//
//  Date + ext.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 17.06.2023.
//

import Foundation

extension Date {
    
    private var calendar: Calendar {
        return Calendar.current
    }
    
    var startOfWeek: Date {
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        guard let firstDay = calendar.date(from: components) else {
            return self
        }
        return calendar.date(byAdding: .day, value: 1, to: firstDay) ?? self
    }
    
    func addForward(to days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    func stripTime() -> Date {
        let componenets = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: componenets) ?? Date()
    }
 }
