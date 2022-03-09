//
//  UIFontExtension.swift
//  
//
//  Created by Aafaq on 09/03/2022.
//

import XCTest
@testable import AATools
import UIKit

final class UIFontExtensionTest: XCTestCase {
    
    var font: UIFont!
    
    override func setUp() {
        super.setUp()
        font = .systemFont(ofSize: 16)
    }

    func test_appFontMethod() {
        let fontTest: UIFont = .appFont(style: .system, size: 16)
        XCTAssertEqual(fontTest, font)
    }

    static var allTests = [
        ("test_appFontMethod", test_appFontMethod),
    ]
}

