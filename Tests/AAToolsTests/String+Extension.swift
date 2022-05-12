//
//  File.swift
//  
//
//  Created by Aafaq on 11/05/2022.
//

import XCTest
@testable import AATools

final class StringExtensionTest: XCTestCase {
    
    func test_estimatedFrameOfString() {
        let heightFrame = "Hello how are you sister where is your hijab?".estimatedHeightOfString(widthOfLabel: 100, font: .appFont(style: .system, size: 20), lineHeight: 25, kern: 1)
        
    }

    static var allTests = [
        ("test_estimatedFrameOfString", test_estimatedFrameOfString),
    ]
}

