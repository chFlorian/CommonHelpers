//
//  DateExtension.swift
//  
//
//  Created by florian schweizer on 16.03.21.
//

import Foundation

extension Date {
    public func localString(dateStyle: DateFormatter.Style = .long,
                     timeStyle: DateFormatter.Style = .none) -> String {
        return DateFormatter.localizedString(
          from: self,
          dateStyle: dateStyle,
          timeStyle: timeStyle)
    }
    
    public static func parse(_ string: String, format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format

        let date = dateFormatter.date(from: string)!
        return date
    }
    
    public func get(_ component: Calendar.Component) -> Int {
        Calendar.current.component(component, from: self)
    }

    public var midnight: Date {
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
    
    public var isToday: Bool {
        self.midnight == Date().midnight
    }
    
    public var dayBefore: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: midnight)!
    }
    
    public var dayAfter: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
    }
    
    public var toDayInt: Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: self) * 365 + calendar.component(.month, from: self) * 30 + calendar.component(.day, from: self)
    }
    
    public static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
