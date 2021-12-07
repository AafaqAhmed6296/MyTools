//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation
extension Int {
    
    /// Convert Integer into specified fomat of string
    /// - Parameter f: format you want string
    /// - Returns: return the formatted stinrg of Int
    public func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
    public func toDouble() -> Double {
        return Double(self)
    }
    
    public func toString() -> String {
        return "\(self)"
    }
    
    public func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }
}
