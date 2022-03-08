//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation
import UIKit

extension Double {
    
    /// This will formate the double in specified.
    /// - Parameter f: number of decimal places you want.
    /// - Returns: string in specified number of decimal places
    public func format(f: String) -> String {
        return String(format: f, self)
    }
    
    /// Convert the double to int
    /// - Returns: returns the Int value of Double
    public func toInt() -> Int {
        return Int(self)
    }
    
    /// Convert the double to CGFloat
    /// - Returns: returns the CGFloat value of Double
    public func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    
    /// Convert the double to String
    /// - Returns: returns the String value of Double
    public func toString() -> String {
        return "\(self)"
    }
    
    /// Convert the double to String without any decimal places of double
    /// - Returns: returns the String value of Double without floating point.
    /// - For example:
    ///  ```
    ///     let double: Double = 2.123
    ///     double.toStringWithoutDecimal() // will return "2"
    ///  ```
    
    public func toStringWithoutDecimal() -> String {
        return "\(Int(self))"
    }
    
    ///  User this method for converting unix style double timestamp to `Date`
    /// - Returns: return the `Date` value of unix style `Double`
    /// - For example
    /// ```
    ///     let unixStyleTimeStampInDouble = 1638909509.647093
    ///     let date = unixStyleTimeStampInDouble.toDate()
    ///
    ///     let formatter = DateFormatter()
    ///     formatter.locale = .current
    ///     formatter.dateFormat = "MMM d h:mm a"
    ///     print(formatter.string(from: date) // will print, Dec 8 1:38 AM
    public func toDate() -> Date {
        return Date(timeIntervalSince1970: self)
    }
}
