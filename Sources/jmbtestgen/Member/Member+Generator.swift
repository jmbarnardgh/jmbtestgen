import Foundation

extension Member {

    var methodSourceCodeTemplate: String {
        return "" // TODO: Implement me!
    }

    public func generate(to relativeOutputDirectory: String) {
        print("Member began generating...")
        switch type {
            // TODO: Finish implementing me!
            case .method: print(sourceForMethod())  // SourceCodeWriter.write(contents: sourceForMethod(), to: relativeOutputDirectory) 
            default: return // TODO: deal with error...
        }
        print("Done generating from member.")
    }

    /**
      Generates `XCTest` source code for method testing if the current
      member type is of type `MemberType.method`.

      Loops through all the `aspects` of `self` (a `Memeber` object) and
      generates source code useful for testing the member (again, represented
      by `self`) in some other Swift Package, project, etc. The genreated
      source code comprises a list of tests, which are executable using the
      `XCTest` framework.

      - see: `Member`
      - see: `MemberType`
     */
    public func sourceForMethod() -> String {
        var sourceCode: String = ""
        guard type == .method else { 
            fatalError("Request source for method type Member, but got something else instead.")
        }
        for aspect in aspects {
            Member.Aspect.nextNumber()
            // Go through all motifs and generate appropriate code...
            for motif in aspect.motifs {
                MotifFactory.nextNumber()
                switch motif {
                    case is StringLengthMotif: sourceCode += String((motif as? StringLengthMotif)!.extrapolatedTests(aspect: aspect))
                    case is PatternConformityMotif: sourceCode += String((motif as? PatternConformityMotif)!.extrapolatedTests(aspect: aspect))
                    default: fatalError("Could not decipher motif.")
                }
            }
        }
        return sourceCode
    }
}