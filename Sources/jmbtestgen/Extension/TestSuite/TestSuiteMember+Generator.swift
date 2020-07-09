import Foundation

extension TestSuiteMember {

    var methodSourceCodeTemplate: String {
        return "" // TODO: Implement me!
    }

    public func generate(to relativeOutputDirectory: String) {
        print("Member began generating...")
        switch type {
            case .method: return sourceForMethod()
            default: return ""
        }
        print("Done generating from member.")
    }

    /**
      Generates `XCTest` source code for method testing if the current
      member type is of type `TestSuiteMemberType.method`.

      Loops through all the `aspects` of `self` (a `Memeber` object) and
      generates source code useful for testing the member (again, represented
      by `self`) in some other Swift Package, project, etc. The genreated
      source code comprises a list of tests, which are executable using the
      `XCTest` framework.

      - see: `TestSuiteMember`
      - see: `TestSuiteMemberType`
     */
    public func sourceForMethod() -> String {
        var testMethodCode: String = ""
        guard type == .method else { 
            fatalError("Request source for method type Member, but got something else instead.")
        }
        for aspect in aspects {
            // Go through all motifs and generate appropriate code...
            testMethodCode.append(
                TestBuilder(
                    name: aspect.name,
                    memberType: type,
                    testing: aspect.role
                )
            )
            if aspect.role == .parameter {

            }
            for motif in aspect.motifs {
                if let m = motif as? StringLengthTestMotif {

                }
            }
        }
        return sourceCode
    }
}