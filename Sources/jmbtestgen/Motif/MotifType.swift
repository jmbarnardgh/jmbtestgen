/**
 Corresponds to a known `Motif` conforming struct, such as `ExactMatchMotif` or
 `StringLengthMotif`. A `MotifType` is used as shorthand for creators of `Manifests`
 to quickly specify a motif to be referenced when generating test source code.

 see: Motif
*/
public enum MotifType {

    public typealias LengthBoundary = UInt
    public typealias Signum = Bool

    case lengthBoundaries(lower: LengthBoundary, upper: LengthBoundary)
    case regularExpressionConformity(pattern: String)

    /// Test generation motif for exact matching of a String value
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