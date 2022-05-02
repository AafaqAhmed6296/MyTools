//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import UIKit
extension Int {
    
    /// Convert Integer into specified fomat of string
    /// - Parameter format: format you want string
    /// - Returns: return the formatted string of Int
    ///
    public func format(_ format: String) -> String {
        String(format: format, self)
    }
    
    public func toDouble() -> Double {
        Double(self)
    }
    
    public func toAuto() -> Double {
        Double(self)
    }
    
    public func toString() -> String {
        "\(self)"
    }
    
    public func toAuto() -> String {
        "\(self)"
    }
    
    public func toCGFloat() -> CGFloat {
        CGFloat(self)
    }
    
    public func toAuto() -> CGFloat {
        CGFloat(self)
    }
}
