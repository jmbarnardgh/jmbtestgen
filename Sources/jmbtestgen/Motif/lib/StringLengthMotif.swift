public struct StringLengthMotif: Motif, Quartileable {

    public var dependencies: [Motif]  {
        return []
    }
    
    private static var shared: Motif?

    public static func currentMotif() -> Motif? {
        return shared
    }

    public typealias QuartileableContent = String
    
    public typealias Quartile = String

    public var quartileableContent: String {
        // TODO: implement me
        return ""
    }
    
    public var testableContent: String = ""
    
    public func quartiles() -> [String] {
        // TODO: Implement me!
        return []
    }
    
    private var lowerBound: UInt
    private var upperBound: UInt
    private let motifType: MotifType

    init(_ motifType: MotifType) {
        switch motifType {
        case .lengthBoundaries(let l, let u): 
            self.lowerBound = l
            self.upperBound = u
            self.motifType = motifType
        default: fatalError("Cannot init StringLengthMotif with unfit motif type: \(motifType).")
        }
    }



    // MARK: Motif protocol conformance

    public var type: MotifType { return motifType } 

    public var description: String { return "stringLength" }

    public var idealVariation: Variation { 
        // TODO: finish implementing me!
        return Variation(variableNameModifier: "String", description: "String", validityVariableSetting: "String", validityExpectation: "String", value: "String")
    }

    public var variations: [Variation] {
        return []
    }
}
