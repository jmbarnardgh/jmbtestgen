
import ArgumentParser
import Foundation

let manifest = TestSuiteManifest(
    entities: [
        TestSuiteEntity(
            name: "MyTestSuite",
            members: [
                TestSuiteMember(
                    name: "myMethod",
                    type: "method",
                    description: "my method that I made",
                    testables: [
                        TestAspect(
                            name: "param1",
                            role: .parameter,
                            attribute: .length
                        )
                    ]
                )
            ]
        )
    ]
)

manifest.writeTestSuite()
