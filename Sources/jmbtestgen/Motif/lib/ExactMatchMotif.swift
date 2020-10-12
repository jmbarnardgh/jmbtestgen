/**
 The `ExactMatchMotif` contains information to facilitate the generating of
 test code for an `Aspect` of a `Member` requiring an exact value.
*/
public struct ExactMatchMotif: Motif {

    public var dependencies: [Motif]  { return [] } // no dependencies
    private static var shared: Motif?
    public static func currentMotif() -> Motif? { return shared }
    
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



    // MARK: - Motif protocol conformance

    public var type: MotifType { return motifType } 
  
    public var description: String { return "exact match" }

    public var idealVariation: Variation { 
        // TODO: finish implementing me!
        return Variation(variableNameModifier: "let", description: "ideal", validityVariableSetting: "true", validityExpectation: "valid", value: self.testableContent)
    }

    public var variations: [Variation] {
        return [idealVariation, missingFirstCharacter, missingLastCharacter]
    }



    // MARK: - Helpers

    // TODO: Think about moving these variations to a common variations file.

    var missingLastCharacter: Variation {
        let lastDropped = String(idealVariation.value.dropLast())
        return Variation(variableNameModifier: "let", description: "lastDropped", validityVariableSetting: "false", validityExpectation: "invalid", value: lastDropped)
    }

    var missingFirstCharacter: Variation {
        let firstDropped = String(idealVariation.value.dropFirst())
        return Variation(variableNameModifier: "let", description: "firstDropped", validityVariableSetting: "false", validityExpectation: "invalid", value: firstDropped)
    }

}
