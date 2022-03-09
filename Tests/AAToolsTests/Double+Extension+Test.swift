//
//  Double+Extension+Test.swift
//  
//
//  Created by Aafaq on 08/03/2022.
//

import XCTest
@testable import AATools

final class DoubleExtensionTests: XCTestCase {
    
    var double: Double!
    
    override func setUp() {
        super.setUp()
        double = 123.1234
    }

    func test_formatMethod() {
        let formatedString = double.format(f: "%.2f")
        XCTAssertEqual(formatedString, "123.12")
    }
    
    func test_toInt() {
        let intValue = double.toInt()
        XCTAssertEqual(intValue, 123)
    }
    
    func test_toCGFloat() {
        let cgFloatValue = double.toCGFloat()
        XCTAssertEqual(cgFloatValue, CGFloat(double))
    }
    
    func test_toString() {
        let stringValue = double.toString()
        XCTAssertEqual(stringValue, "123.1234")
    }
    
    func test_toStringWithoutDecimal() {
        let stringWithouDecimal = double.toStringWithoutDecimal()
        XCTAssertEqual(stringWithouDecimal, "123")
    }
    
    func test_toDate() {
        let dateValue = double.toDate()
        let date = Date(timeIntervalSince1970: double)
        XCTAssertEqual(dateValue, date)
    }

    static var allTests = [
        ("test_formatMethod", test_formatMethod),
        ("test_toInt", test_toInt),
        ("test_toCGFloat", test_toCGFloat),
        ("test_toString", test_toString),
        ("test_toStringWithoutDecimal", test_toStringWithoutDecimal),
        ("test_toDate", test_toDate),
    ]
}
