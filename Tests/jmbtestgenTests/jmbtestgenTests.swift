import XCTest
@testable import jmbtestgen

final class jmbtestgenTests: XCTestCase {
   
    func testExample() {
        let magnitude: Int = 15
        XCTAssertTrue(magnitude == 15)
        print("end of tests")
    }

    func testGenerateExampleTestSuite() {
        Manifest(
            entities: [
                Entity(
                    name: "MyEntity",
                    members: [
                        Member(
                            name: "myMethod",
                            type: .method,
                            description: "my method that I made",
                            tryable: false,
                            aspects: [
                                Member.Aspect(
                                    name: "param1",
                                    role: .parameter,
                                    dataType: .string,
                                    motifs: [
                                        .lengthBoundaries(lower: 3, upper: 10),
                                        .regularExpressionConformity(pattern: "^[a-zA-Z]$")
                                    ]
                                )
                            ]
                        )
                    ]
                )
            ]
        )
        .generate(to: "output/directory")
    }

    static var allTests = [
        ("testExample", testExample),
        ("testGenerateExampleTestSuite", testGenerateExampleTestSuite)
    ]
}
