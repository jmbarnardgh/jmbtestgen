import XCTest
@testable import jmbtestgen

final class jmbtestgenTests: XCTestCase {
   
    func testExample() {
        let magnitude: Int = 15
        XCTAssertTrue(magnitude == 15)
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
                                // Member.Aspect(
                                //     name: "myParam",
                                //     role: .parameter,
                                //     dataType: .string,
                                //     motifs: [
                                //         .lengthBoundaries(lower: 3, upper: 10),
                                //         .regularExpressionConformity(pattern: "^[a-zA-Z]$")
                                //     ]
                                // ),
                                Member.Aspect(
                                    name: "anotherParam",
                                    role: .parameter,
                                    dataType: .string,
                                    motifs: [
                                        .exactMatch(value: "Hello, another parameter!")
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
