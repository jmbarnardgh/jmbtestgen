public struct StringLengthMotif: Motif, Quartileable {

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

    public func extrapolatedTests(aspect: Member.Aspect) -> String {
        var source: String = ""
        switch aspect.dataType {
        case .string:
            if aspect.role == .parameter {
                let variation = "lengthBoundary"
                source.append("func ")
                source.append("test_")
                source.append("\(Entity.num)_\(Entity.current!.name)_")
                source.append("\(Member.num)_")
                source.append("\(Member.Aspect.num)_")
                source.append("\(MotifFactory.num)_")
                source.append("\(variation) {\n")
                source.append("<#code#>\n")
                source.append("}\n\n")
            }
        default: fatalError("aspect type not recognized for \(#function)")            
        }
        return source
    }

}
