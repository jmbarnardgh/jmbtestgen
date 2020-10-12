/**
 Factory that can return a `Motif` based on a provided `MotifType`
*/
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