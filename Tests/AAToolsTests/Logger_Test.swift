//
//  File.swift
//  
//
//  Created by Aafaq on 09/05/2022.
//

import Foundation
import XCTest
import AATools


final class LoggerTest: XCTestCase {
    
    func test_log() {
        
        
        Debug.isDebugModeEnable = true
        Debug.log(message: "Hello", values: 1, 2, 3, "Hello")
        Debug.log(message: "Hello", values: "Hello", 1, 3, 4)
        Debug.log(message: "Hello", variable: nil)
        
        printd(1,2,34)
    }

    static var allTests = [
        ("test_log", test_log),
    ]
}
