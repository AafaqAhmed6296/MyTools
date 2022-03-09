//
//  Int+Extension_Tests.swift
//  
//
//  Created by Aafaq on 08/03/2022.
//

import XCTest
@testable import AATools

final class IntExtensionTests: XCTestCase {
    
    var int: Int!
    
    override func setUp() {
        super.setUp()
        int = 123
    }
    
    func test_format() {
        let formatedIntString1 = int.format("%04d")
        let formatedIntString2 = String(format: "%04d", 123)
        XCTAssertEqual(formatedIntString1, formatedIntString2)
    }
    
    func test_toCGFloat() {
        let cgFloatValue = int.toCGFloat()
        XCTAssertEqual(cgFloatValue, CGFloat(int))
    }
    
    func test_toString() {
        let stringValue = int.toString()
        XCTAssertEqual(stringValue, "123")
    }
    
    func test_toDouble() {
        let doubleValue1 = int.toDouble()
        XCTAssertEqual(doubleValue1, Double(int))
    }

    static var allTests = [
        ("test_format", test_format),
        ("test_toCGFloat", test_toCGFloat),
        ("test_toString", test_toString),
        ("test_toDouble", test_toDouble),
    ]
}
