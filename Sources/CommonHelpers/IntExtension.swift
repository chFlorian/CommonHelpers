//
//  IntExtension.swift
//  
//
//  Created by florian schweizer on 16.03.21.
//

import Foundation

extension Int {
    var asTimeString: String {
        let (hours, minutes, seconds) = (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
        return "\(hours > 0 ? "\(hours)h " : "")\(minutes > 0 ? "\(minutes)m " : "")\(seconds)s"
    }
}
