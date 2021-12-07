//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation

extension Date {
    /// Convert the Date object to String in specified format
    /// - Parameter format: The format in which you want to convert string of date default value is "dd-MM-yyyy"
    /// - Returns: A formatted date in string
    public func toString(format: String?="dd-MMM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = .autoupdatingCurrent
        formatter.calendar = .autoupdatingCurrent
        return formatter.string(from: self)
    }
}
