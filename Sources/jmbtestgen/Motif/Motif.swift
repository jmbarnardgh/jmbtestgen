/**
 A protocol which guides the implementation of motifs for testing an `Aspect` of a `Member`,
 such as bounds, existence, conformity, quantity, and so on. Adopters of the `Motif`
 protocol must return a motif `type` and implement a method for extrapolating unit tests
 from the information stored in the adopter.

 Example:
 
 A struct `MyPalindromeMotif` conforms to the `Motif` protocol. As a conformer to
 `Motif`, `MyPalindromeMotif` declares the `palindrome` `MotifType` as its type. When unit
 tests are generated for a `Aspect` assigned the `MyPalindromeMotif`, the motif will
 be referenced to ensure common facets of a palindrome are checked for said `Aspect`.
 In the code below, the member `myMethod` will be tested. One aspect of `myMethod` is that
 it has a parameter called `myParam`. Said aspect needs to be tested to ensure it is a
 palindrome. Using the `.palindrome` motif type, the generator will reference
 `MyPalindromeMotif` to ensure that the proper partial or full unit test source code
 is generated.

 ```
    Manifest(
        entities: [
            Entity(
                name: "MyEntity",
                members: [
                    Member(
                        name: "myMethod",
                        type: .method,
                        description: "My method that I made",
                        tryable: false,
                        aspects: [
                            Aspect(
                                name: "myParam",
                                role: .parameter,
                                dataType: .string,
                                motifs: [ .palindrome ]
                            )
                        ]
                    )
                ]
            )
        ]
    )
 ```
 */
public protocol Motif {
    var type: MotifType { get }
    var description: String { get }
    var idealVariation: Variation { get }
    var variations: [Variation] { get }
    func extrapolatedTests(aspect: Aspect) -> String
    static func currentMotif() -> Motif?
    var dependencies: [Motif] { get }
    // TODO: Think about how to incorporate aspect dependencies... e.g. string length yields to allowed characters first
}
