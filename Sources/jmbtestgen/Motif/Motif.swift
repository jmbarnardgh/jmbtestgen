
/**
 A protocol which guides the implementation of motifs for testing an `Aspect` of a `Member`,
 such as bounds, existence, conformity, quantity, and so on. Adopters of the `Motif`
 protocol must return a motif `type` and implement a method for extrapolating unit tests
 from the information stored in the adopter.

 Example:
 
 A struct `MyPalindromeMotif` conforms to the `Motif` protocol. As a conformer to
 `Motif`, `MyPalindromeMotif` declares the `palindrome` `MotifType` as its type. When unit
 tests are generated for a `Member.Aspect` assigned the `MyPalindromeMotif`, the motif will
 be referenced to ensure common facets of a palindrome are checked for said `Member.Aspect`.
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
                            Member.Aspect(
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
    func extrapolatedTests(aspect: Member.Aspect) -> String
    static func currentMotif() -> Motif?
    var dependencies: [Motif] { get }
    // TODO: Think about how to incorporate aspect dependencies... e.g. string length yields to allowed characters first
}

extension Motif {
    public func extrapolatedTests(aspect: Member.Aspect) -> String {
        var source: String = ""
        for variation in variations {
            Variation.nextNumber()
            switch aspect.dataType {
            case .string:
                if aspect.role == .parameter {
                    let motifTypeHumanDescription = self.type.described()
                    let motifTypeMethodNameAddendum = self.type.testMethodDescription()
                    source.append("    /// Test \(Entity.num).\(Member.num).\(Member.Aspect.num).\(Variation.num)\n")
                    source.append("    /// \n")                    
                    source.append("    /// `\(Entity.shared!.name).\(Member.shared!.name)` should have \(aspect.role) `\(aspect.name)` \(variation.description) for \(motifTypeHumanDescription).\n")
                    source.append("    func ")
                    source.append("test_")
                    source.append("\(Entity.num)_")
                    source.append("\(Member.num)_")
                    source.append("\(Member.Aspect.num)_")
                    source.append("\(Variation.num)_")
                    source.append("\(Entity.shared!.name)_")
                    source.append("\(Member.shared!.name)_")
                    source.append("\(motifTypeMethodNameAddendum)_")
                    source.append("\(variation.variableNameModifier)() ")
                    source.append("{\n")
                    source.append("        <#code#>\n")
                    source.append("    }\n\n")
                }
            default: fatalError("aspect type not recognized for \(#function)")            
            }
        }
        return source
    }
}

public enum MotifType {

    public typealias LengthBoundary = UInt
    public typealias Signum = Bool

    case lengthBoundaries(lower: LengthBoundary, upper: LengthBoundary)
    case regularExpressionConformity(pattern: String)
    case exactMatch(value: String)
    case exactNonMatch(value: String)
    case directionalChange(changedTo: Signum)
    case directionalState(state: Signum)

    public func described() -> String {
        switch self {
            case .lengthBoundaries(_, _): return "length boundaries"
            case .regularExpressionConformity(pattern: _): return "regular expression conformity"
            case .exactMatch(value: _): return "exact match"
            case .exactNonMatch(value: _): return "exact non-match"
            case .directionalChange(changedTo: _): return "directional change"
            case .directionalState(state: _): return "directional state"
        }
    }

    public func testMethodDescription() -> String {
        switch self {
            case .lengthBoundaries(_, _): return "lengthBoundaries"
            case .regularExpressionConformity(pattern: _): return "regularExpressionConformity"
            case .exactMatch(value: _): return "exactMatch"
            case .exactNonMatch(value: _): return "exactNonMatch"
            case .directionalChange(changedTo: _): return "directionalChange"
            case .directionalState(state: _): return "directionalState"
        }
    }
}

public struct MotifError: Error {
    var message: String
}

public struct MotifFactory {

    public static var num: Int = 0
    public static func nextNumber() {
        num = num + 1
    }

    public static func motif(for motifType: MotifType) -> Motif {
        switch motifType {
        case .lengthBoundaries: return StringLengthMotif(motifType)
        case .regularExpressionConformity: return PatternConformityMotif(motifType)
        case .exactMatch:
            let motif = ExactMatchMotif(motifType)
            return motif
        default: fatalError("Could not generate a proper motif for provided motif type.")
        }
    }    
}
