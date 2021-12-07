//
//  File.swift
//  
//
//  Created by Aafaq on 08/12/2021.
//

import Foundation

/// Use to compare string base on just date not time.
/// - Returns: `Boolean`
func === (lhs: Date, rhs: Date) -> Bool {
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.dateFormat = "dd MM yyyy"
    return formatter.string(from: lhs) == formatter.string(from: rhs)
}
