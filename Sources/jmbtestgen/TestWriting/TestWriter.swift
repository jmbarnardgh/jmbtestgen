
/// Writes test source code based on provided object.
public class TestWriter {

    public static func docComments(for aspect: Aspect, variation vn: Variation, and motif: Motif) -> String {
        var source: String = ""
        let entity = Entity.shared!
        let member = Member.shared!
        let variation = vn
        source.append("\n")
        source.append("    /// `\(Entity.shared!.name).\(Member.shared!.name)` should have \(aspect.role) `\(aspect.name)` \(variation.description) for \(motif.description).\n")
        source.append("    /// - Test Number: \(Entity.num).\(Member.num).\(Aspect.num).\(Variation.num)\n")
        source.append("    /// - Entity: `\(entity.name)`\n")      
        source.append("    /// - Member: `\(member.name)`\n")                                  
        source.append("    /// - Aspect: `\(aspect.name)`\n")                                  
        source.append("    /// - Motif: `\(motif.description)`\n")  
        source.append("    /// - Variation: `\(variation.description)`\n")
        source.append("    /// - Validity of Tested Aspect: `\(variation.validityExpectation)`\n")
        source.append("    /// - Expected Result Value: `\(variation.validityVariableSetting)`\n")
        return source
    }

    public static func testFunctionName(from motifTypeMethodNameAddeundum: String, and variableNameModifier: String) -> String {
        var source: String = ""
        source.append("    func ")
        source.append("test_")
        source.append("\(Entity.num)_")
        source.append("\(Member.num)_")
        source.append("\(Aspect.num)_")
        source.append("\(Variation.num)_")
        source.append("\(Entity.shared!.name)_")
        source.append("\(Member.shared!.name)_")
        source.append("\(motifTypeMethodNameAddeundum)_")
        source.append("\(variableNameModifier)() ")
        source.append("{\n")
        return source
    }

}