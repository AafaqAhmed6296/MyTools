//
//  File.swift
//  
//
//  Created by Aafaq on 08/03/2022.
//

import UIKit
import XCTest
@testable import AATools

final class UIColorTests: XCTestCase {
    
    var rgbColor: UIColor!
    
    override func setUp() {
        //rgba(52, 152, 219,1.0)
        rgbColor = UIColor(red: CGFloat(52) / 255, green: CGFloat(152) / 255, blue: CGFloat(219) / 255, alpha: 1.0)
    }
    
    func test_initializerForHexValue() {
        let hexColor = UIColor(hexValue: 0x3498db)
        XCTAssertEqual(hexColor, rgbColor)
    }
    
    func test_rgb() {
        let rgb = UIColor.rgb(red: 52, green: 152, blue: 219)
        XCTAssertEqual(rgb, rgbColor)
    }

    static var allTests = [
        ("test_initializerForHexValue", test_initializerForHexValue),
        ("test_rgb", test_rgb),
    ]
}
