import jmbtestgen

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
                        Aspect(
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
