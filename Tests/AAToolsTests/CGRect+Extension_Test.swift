//
//  CGRectTests.swift
//  
//
//  Created by Aafaq on 08/03/2022.
//

import UIKit
import XCTest
@testable import AATools

final class CGRectTests: XCTestCase {
    
    var cgRect1 = CGRect(x: 1, y: 2, width: 3, height: 4)
    var cgRect2 = CGRect(x: 1, y: 2, width: 3, height: 4)
    
    override func setUp() {
        cgRect1 = CGRect(x: 1, y: 2, width: 3, height: 4)
        cgRect2 = CGRect(x: 1, y: 2, width: 3, height: 4)
    }
    
    func test_addOperatorMethod() {

        
        let result1 = cgRect1 + cgRect2
        let result2 = CGRect(x: cgRect1.minX + cgRect2.minX, y: cgRect1.minY + cgRect2.minY, width: cgRect1.width + cgRect2.width, height: cgRect1.height + cgRect2.height)
        XCTAssertEqual(result1, result2)
    }

    static var allTests = [
        ("test_addOperatorMethod", test_addOperatorMethod),
    ]
}
