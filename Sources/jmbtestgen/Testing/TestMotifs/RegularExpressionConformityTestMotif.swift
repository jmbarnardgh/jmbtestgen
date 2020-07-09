public struct RegularExpressionConformityTestMotif: TestMotif {
        
    private var pattern: String
    private let motifType: TestMotifType

    public var type: TestMotifType { return motifType }

    init(_ motifType: TestMotifType) {
        switch motifType {
        case .regularExpressionConformity(let p): 
            self.pattern = p
            self.motifType = motifType
        default: fatalError("Cannot init RegularExpressionConformityTestMotif with non-pattern motif type.")
        }
    }
}