
public enum TestMotifType {

    public typealias LengthBoundary = UInt
    public typealias Signum = UInt

    case lengthBoundaries(lower: LengthBoundary, upper: LengthBoundary)
    case regularExpressionConformity(pattern: String)
    case exactMatch(value: String)
    case exactNonMatch(value: String)
    case directionalChange(changedTo: Signum)
}

public protocol TestMotif {
    var type: TestMotifType { get }
}

public struct TestMotifError: Error {
    var message: String
}

public struct TestMotifFactory {

    public static func motif(for motifType: TestMotifType) -> TestMotif {
        switch motifType {
        case .lengthBoundaries: return StringLengthTestMotif(motifType)
        case .regularExpressionConformity: return RegularExpressionConformityTestMotif(motifType)
        default: fatalError("Could not generate a proper motif for provided motif type.")
        }
    }

}