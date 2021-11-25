//
//  Literals.swift
//  
//
//  Created by Florian Schweizer on 25.11.21.
//

import Foundation

extension Date: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        self = formatter.date(from: value)!
    }
}

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
