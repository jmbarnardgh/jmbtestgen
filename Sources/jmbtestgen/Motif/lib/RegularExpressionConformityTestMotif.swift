public struct RegularExpressionConformityMotif: Motif {
        
    private var pattern: String
    private let motifType: MotifType

    public var type: MotifType { return motifType }

    public var description: String {
        return "regexConformity"
    }

    init(_ motifType: MotifType) {
        switch motifType {
        case .regularExpressionConformity(let p): 
            self.pattern = p
            self.motifType = motifType
        default: fatalError("Cannot init RegularExpressionConformityMotif with non-pattern motif type.")
        }
    }
    
    public func extrapolatedTests(aspect: Member.Aspect) -> String {
        var source: String = ""
        switch aspect.dataType {
        case .string:
            if aspect.role == .parameter {
                let variation = "regexConformity"
                source.append("func ")
                source.append("test_")
                source.append("\(Entity.num)_")
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