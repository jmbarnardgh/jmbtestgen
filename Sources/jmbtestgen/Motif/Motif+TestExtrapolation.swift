extension Motif {
    public func extrapolatedTests(aspect: Aspect) -> String {
        var source: String = ""
        for variation in variations {
            Variation.nextNumber()
            switch aspect.dataType {
            case .string:
                if aspect.role == .parameter {
                    let motifTypeMethodNameAddendum = self.type.testMethodDescription()
                    source.append(TestWriter.docComments(for: aspect, variation: variation, and: self))
                    source.append(TestWriter.testFunctionName(from: motifTypeMethodNameAddendum, and: variation.variableNameModifier))
                    source.append("        let testableContent = \"\(variation.value)\"\n")
                    source.append("        let result = \(Member.shared!.name)(<#code with testableContent#>)\n")
                    source.append("        XCTAssert(result == \(variation.validityVariableSetting))\n")
                    source.append("    }\n")
                } else if aspect.role == .value {
                    let motifTypeMethodNameAddendum = self.type.testMethodDescription()
                    source.append(TestWriter.docComments(for: aspect, variation: variation, and: self))                    
                    source.append(TestWriter.testFunctionName(from: motifTypeMethodNameAddendum, and: variation.variableNameModifier))
                    source.append("        let entity = \(Entity.shared!.name)(<#initialization parameters if needed#>)\n")
                    source.append("        let testableContent = \"\(variation.value)\"\n")
                    source.append("        entity.\(Member.shared!.name).\(Aspect.shared!.name) = testableContent\n")
                    source.append("        let result = <#validation method on entity.\(Member.shared!.name).\(Aspect.shared!.name)#>\n")
                    source.append("        XCTestAssert(result == \(variation.validityVariableSetting))\n")
                    source.append("    }\n")
                }
            default: fatalError("aspect type not recognized for \(#function)")     
            }
        }
        return source
    }
}