//
//  Date.swift
//

import Foundation

public extension Date {
    
    public init(year: Int = 0, month: Int = 0, day: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = TimeZone.current
        let calender = Calendar(identifier: .gregorian)
        let date = calender.date(from: dateComponents) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
}
