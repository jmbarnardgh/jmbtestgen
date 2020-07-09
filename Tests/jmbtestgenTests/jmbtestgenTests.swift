import XCTest
@testable import jmbtestgen

final class jsontestgenTests: XCTestCase {
    func testExample() {
        let d: GrowthDirection = .shrink 
        let magnitude: Int = 15
        XCTAssertTrue(magnitude == 15)
        print("end of tests")
    }

    func test_templateExample_testName() {
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
