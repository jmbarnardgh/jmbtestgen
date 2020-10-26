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
        return Variation(variableNameModifier: "exactMatch", description: "the ideal value for an exact match", validityVariableSetting: "true", validityExpectation: "valid", value: self.testableContent)
    }

    public var variations: [Variation] {
        var variationList = [idealVariation]
        if idealVariation.value.count > 1 { variationList.append(missingLastCharacterVariation) }
        if idealVariation.value.count > 2 { variationList.append(missingFirstCharacterVariation) }
        if idealVariation.value.count > 3 {
            variationList.append(contentsOf: quartileVariations)
        }
        return variationList
    }



    // MARK: - Helpers

    // TODO: Think about moving these variations to a common variations file.

    var missingLastCharacterVariation: Variation {
        let lastDropped = String(idealVariation.value.dropLast())
        return Variation(variableNameModifier: "lastDropped", description: "the ideal value, but with the last character dropped", validityVariableSetting: "false", validityExpectation: "invalid", value: lastDropped)
    }

    var missingFirstCharacterVariation: Variation {
        let firstDropped = String(idealVariation.value.dropFirst())
        return Variation(variableNameModifier: "firstDropped", description: "the ideal value, but with the first character dropped", validityVariableSetting: "false", validityExpectation: "invalid", value: firstDropped)
    }

    var quartileVariations: [Variation] {
        var variations: [Variation] = []
        let idealContent = idealVariation.value
        let quartiles = idealContent.quartiles()
        var i = 0
        for q in quartiles {
            var quartile: String = ""
            if i == 0 {
                quartile = String(q)
                let v = Variation(variableNameModifier: "firstQuartile", description: "up to 1st quartile of string characters", validityVariableSetting: "false", validityExpectation: "invalid", value: quartile)
                variations.append(v)
            }
            if i == 1 { 
                quartile = String(q)
                let v = Variation(variableNameModifier: "secondQuartile", description: "up to 2nd quartile of string characters", validityVariableSetting: "false", validityExpectation: "invalid", value: quartile)
                variations.append(v)
            }
            if i == 2 { 
                quartile = String(q)
                let v = Variation(variableNameModifier: "thirdQuartile", description: "up to 3rd quartile of string characters", validityVariableSetting: "false", validityExpectation: "invalid", value: quartile)
                variations.append(v)
            }
            if i == 3 {
                quartile = String(q)
                let v = Variation(variableNameModifier: "lastQuartile", description: "up to 4th quartile of string characters", validityVariableSetting: "false", validityExpectation: "invalid", value: quartile)
                variations.append(v)
            }
            i = i + 1
        }
        return variations
    }

}
