//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation

extension String {
    ///  Use to multiply string realy quikc for dummy string creation
    /// - Returns: It will return the actual string by the number of times with integer you are multiplying
    public static func * (lhs: String, rhs: Int) -> String {
        var string = ""
        (0..<rhs).forEach { (_) in
            string = string + lhs
        }
        return string
    }
}

