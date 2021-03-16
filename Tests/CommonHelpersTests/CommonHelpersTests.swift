import XCTest
@testable import CommonHelpers

final class CommonHelpersTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CommonHelpers().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
