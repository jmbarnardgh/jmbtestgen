
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
    func extrapolatedTests(aspect: Member.Aspect) -> [String]
    static func nextNumber() -> Int
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
}

public struct MotifError: Error {
    var message: String
}

public struct MotifFactory {

    public static func motif(for motifType: MotifType) -> Motif {
        switch motifType {
        case .lengthBoundaries: return StringLengthMotif(motifType)
        case .regularExpressionConformity: return RegularExpressionConformityMotif(motifType)
        default: fatalError("Could not generate a proper motif for provided motif type.")
        }
    }
}
