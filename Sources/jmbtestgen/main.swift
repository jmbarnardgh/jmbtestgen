TestSuiteManifest(
    entities: [
        TestSuiteEntity(
            name: "MyTestSuite",
            members: [
                TestSuiteMember(
                    name: "myMethod",
                    type: .method,
                    description: "my method that I made",
                    tryable: true,
                    aspects: [
                        TestAspect(
                            name: "param1",
                            role: .parameter,
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