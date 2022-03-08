import XCTest

import AAToolsTests

var tests = [XCTestCaseEntry]()
tests += AAToolsTests.allTests()
tests += UIColorTests.allTests()
XCTMain(tests)
