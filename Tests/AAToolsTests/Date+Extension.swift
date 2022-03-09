//
//  Date+Extension.swift
//  
//
//  Created by Aafaq on 08/03/2022.
//

import XCTest
@testable import AATools

final class DateExtensionTests: XCTestCase {
    
    var date: Date!
    
    override  func setUp() {
        super.setUp()
        date = Date()
    }
    
    func test_toString() {
        let stringDate1 = date.toString()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        formatter.locale = .autoupdatingCurrent
        formatter.calendar = .autoupdatingCurrent
        
        let stringDate2 = formatter.string(from: date)
        XCTAssertEqual(stringDate1, stringDate2)
    }

    static var allTests = [
        ("test_toString", test_toString),
    ]
}
