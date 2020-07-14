
/**
 A protocol which guides the implementation of motifs for testing, such as boundary/limit testing, conformance
 testing, etc. Adopters of the `Motif` protocol must return a motif `type` and implement a method for
 extrapolating unit tests from the information stored in the adopter.
 
 - Example: a class `MyUpwardMotif` is a `struct` which conforms to the `Motif` protocol. As an
         adopter of the `Motif` protocol, `MyUpwardMotif` declares the `MotifType`
         `directionalState` as its `type` and returns source code for unit tests when the
         `extrapolatedTests(:)` method is called. The unit tests test that an upward direction is
         being returned by a function of some entity in a project's source code. The upward direction is
         represented in `MyUpwardMotif` as `Signum` which stores binary information.
         The binary value is then used to represent either "upward" or "not upward".
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
            switch aspect.dataType {
            case .string:
                if aspect.role == .parameter {
                    let motifType = self.type.described()
                    source.append("func ")
                    source.append("test_")
                    source.append("\(Entity.num)_")
                    source.append("\(Member.num)_")
                    source.append("\(Member.Aspect.num)_")
                    source.append("\(MotifFactory.num)_")
                    source.append("\(Variation.num)_")
                    source.append("\(Entity.shared!.name)_")
                    source.append("\(Member.shared!.name)_")
                    source.append("\(Variation.shared?.variableNameModifier)")
                    source.append("\(motifType)_")
                    source.append("{\n")
                    source.append("<#code#>\n")
                    source.append("}\n\n")
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
        default: fatalError("Could not generate a proper motif for provided motif type.")
        }
    }
}
