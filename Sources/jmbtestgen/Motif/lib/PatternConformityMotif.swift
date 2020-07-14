public struct PatternConformityMotif: Motif {
       
    static var shared: Motif?
    public static func currentMotif() -> Motif? {
         return shared
    }

        
    private var pattern: String
    private let motifType: MotifType

    init(_ motifType: MotifType) {
        switch motifType {
        case .regularExpressionConformity(let p): 
            self.pattern = p
            self.motifType = motifType
        default: fatalError("Cannot init RegularExpressionConformityMotif with non-pattern motif type.")
        }
    }



    // MARK: Motif protocol conformance

    public var type: MotifType { return motifType }

    public var description: String { return "regexConformity" }

    private var _dependencies: [Motif] = []
    public var dependencies: [Motif] {
        // TODO: Implement me
        return []
    }

    public var idealVariation: Variation {
        // TODO: build the "safest" variation
        let value: String = "some value" // TODO: make this computed...
        let v = Variation(variableNameModifier: "certainlyConforming", description: "well within pattern", validityExpectation: "valid", value: value)
        return v
    }

    public var variations: [Variation] {

        let ideal = idealVariation
        let empty = Variation(variableNameModifier: "empty", description: "empty string", validityExpectation: "String", value: "")
        return [ideal, empty]
    }
}