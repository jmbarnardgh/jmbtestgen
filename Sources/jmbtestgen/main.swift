
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
                    testTemplates: [
                        TestTemplate(strings: ["abc123"])
                    ]
                )
            ]
        )
    ]
)

manifest.writeTestSuite()
