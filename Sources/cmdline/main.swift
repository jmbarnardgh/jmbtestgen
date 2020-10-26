import jmbtestgen

Manifest(
    testableTargetName: "SomeApp",
    entities: [
        Entity(
            name: "MyModel",
            members: [
                Member(
                    name: "myAccount",
                    type: .variable,
                    description: "my account number",
                    tryable: false,
                    aspects: [
                        Aspect(
                            name: "textField", role: .value, dataType: .string, motifs: [
                                .regularExpressionConformity(pattern: "^(AA|BB){1,1}\\d{1,5}$")                            ]
                        )
                    ]
                )
            ]
        )
    ]
).generate(to: "output/directory")