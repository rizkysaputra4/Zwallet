//
//  DateExtension.swift
//  Core
//
//  Created by Rizky Saputra on 30/05/21.
//

import Foundation

public extension Date {
    
     func toDateTimeFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss"
        return formatter.string(from: self)
    }
    
}
