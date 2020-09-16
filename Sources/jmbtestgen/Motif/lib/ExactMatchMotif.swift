public struct ExactMatchMotif: Motif {

    public var dependencies: [Motif]  {
        return [] // no dependencies
    }
    
    private static var shared: Motif?

    public static func currentMotif() -> Motif? {
        return shared
    }
    
    public var testableContent: String = ""
    
    private let motifType: MotifType

    init(_ motifType: MotifType) {
        switch motifType {
        case .exactMatch(let s): 
            self.testableContent = s
            self.motifType = motifType
        default: fatalError("Cannot init ExactMatchMotif with unfit motif type: \(motifType).")
        }
    }



    // MARK: Motif protocol conformance

    public var type: MotifType { return motifType } 

    public var description: String { return "exact match" }

    public var idealVariation: Variation { 
        // TODO: finish implementing me!
        return Variation(variableNameModifier: "String", description: "String", validityVariableSetting: "String", validityExpectation: "String", value: "String")
    }

    public var variations: [Variation] {
        return [idealVariation]
    }
}
