import XCTest
@testable import jsontestgen

final class jsontestgenTests: XCTestCase {
    func testExample() {
        let d: GrowthDirection = .shrink 
        let magnitude: Int = 15
        XCTAssertTrue(magnitude == 15)
        print("end of tests")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
