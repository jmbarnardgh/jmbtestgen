extension Motif {
    public func extrapolatedTests(aspect: Aspect) -> String {
        var source: String = ""
        for variation in variations {
            Variation.nextNumber()
            switch aspect.dataType {
            case .string:
                if aspect.role == .parameter {
                    let motifTypeHumanDescription = self.type.described()
                    let motifTypeMethodNameAddendum = self.type.testMethodDescription()
                    source.append("    /// Test \(Entity.num).\(Member.num).\(Aspect.num).\(Variation.num)\n")
                    source.append("    /// \n")                    
                    source.append("    /// `\(Entity.shared!.name).\(Member.shared!.name)` should have \(aspect.role) `\(aspect.name)` \(variation.description) for \(motifTypeHumanDescription).\n")
                    source.append("    func ")
                    source.append("test_")
                    source.append("\(Entity.num)_")
                    source.append("\(Member.num)_")
                    source.append("\(Aspect.num)_")
                    source.append("\(Variation.num)_")
                    source.append("\(Entity.shared!.name)_")
                    source.append("\(Member.shared!.name)_")
                    source.append("\(motifTypeMethodNameAddendum)_")
                    source.append("\(variation.description)() ")
                    source.append("{\n")
                    source.append("        let testableContent = \"\(variation.value)\"\n")
                    source.append("        let result = \(Member.shared!.name)(<#code with testableContent#>)\n")
                    source.append("        XCTestAssert(result == \(variation.validityVariableSetting))\n")
                    source.append("    }\n\n")
                }
            default: fatalError("aspect type not recognized for \(#function)")            
            }
        }
        return source
    }
}