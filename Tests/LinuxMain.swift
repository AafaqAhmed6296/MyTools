import XCTest

import AAToolsTests

var tests = [XCTestCaseEntry]()
tests += AAToolsTests.allTests()
tests += UIColorExtensionTests.allTests()
tests += CGRectTests.allTests()
tests += IntExtensionTests.allTests()
tests += DoubleExtensionTests.allTests()
XCTMain(tests)
