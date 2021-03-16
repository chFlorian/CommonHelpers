//
//  DateExtension.swift
//  
//
//  Created by florian schweizer on 16.03.21.
//

import Foundation

extension Date {
    func localString(dateStyle: DateFormatter.Style = .long,
                     timeStyle: DateFormatter.Style = .none) -> String {
        return DateFormatter.localizedString(
          from: self,
          dateStyle: dateStyle,
          timeStyle: timeStyle)
    }
    
    static func parse(_ string: String, format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format

        let date = dateFormatter.date(from: string)!
        return date
    }

    var midnight: Date {
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
    
    var isToday: Bool {
        self.midnight == Date().midnight
    }
    
    var dayBefore: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: midnight)!
    }
    
    var dayAfter: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
    }
    
    var toDayInt: Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: self) * 365 + calendar.component(.month, from: self) * 30 + calendar.component(.day, from: self)
    }
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
