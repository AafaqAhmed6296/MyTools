import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AAToolsTests.allTests),
        testCase(UIColorTests.allTests),
    ]
}
#endif
