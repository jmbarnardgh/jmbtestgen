import XCTest
@testable import jsontestgen

final class jsontestgenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(jsontestgen().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
