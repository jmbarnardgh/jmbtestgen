import Foundation

extension Member {

    var methodSourceCodeTemplate: String {
        return "" // TODO: Implement me!
    }

    public func generate(to relativeOutputDirectory: String) {
        var sourceCodeString: String = ""
        sourceCodeString += """
import XCTest
@testable import \(Manifest.shared!.testableTargetName)

/// Automated tests for \(name)
final class \(name.capitalizingFirstLetter())Tests: XCTestCase {

"""
        switch type {
            case .method: sourceCodeString += sourceForMethod()
            case .variable: sourceCodeString += sourceForVariable()
        }
        var path = FileManager.default.currentDirectoryPath + "/" + relativeOutputDirectory
        if !FileManager.default.fileExists(atPath: path) {
            try! FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
        }
        path = path + "/" + name.capitalizingFirstLetter() + "Tests.swift"

sourceCodeString += """

}
"""
        let data = sourceCodeString.data(using: .utf8)
        FileManager.default.createFile(atPath: path, contents: data)
        // try! sourceCodeString.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
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
            fatalError("Request source for method member, but got something else instead.")
        }
        for aspect in aspects {
            Aspect.shared = aspect
            Aspect.nextNumber()
            // Go through all motifs and generate appropriate code...
            for motif in aspect.motifs {
                MotifFactory.nextNumber()
                switch motif {
                    case is StringLengthMotif:
                        sourceCode += String((motif as? StringLengthMotif)!.extrapolatedTests(aspect: aspect))
                    case is PatternConformityMotif: 
                        sourceCode += String((motif as? PatternConformityMotif)!.extrapolatedTests(aspect: aspect))
                    case is ExactMatchMotif:
                        let exactMatchMotifSource = String((motif as? ExactMatchMotif)!.extrapolatedTests(aspect: aspect))
                        sourceCode += exactMatchMotifSource
                    default: fatalError("Could not decipher motif.")
                }
            }
        }
        return sourceCode
    }

    public func sourceForVariable() -> String {
        var sourceCode: String = ""
        guard type == .variable else {
            fatalError("Request source for variable member, but got something else instead.")
        }
        for aspect in aspects {
            Aspect.shared = aspect
            Aspect.nextNumber()
            // Go through all motifs and generate appropriate code...
            for motif in aspect.motifs {
                switch motif {
                    case is StringLengthMotif: sourceCode += String((motif as? StringLengthMotif)!.extrapolatedTests(aspect: aspect))
                    case is PatternConformityMotif: sourceCode += String((motif as? PatternConformityMotif)!.extrapolatedTests(aspect: aspect))
                    case is ExactMatchMotif: sourceCode += String((motif as? ExactMatchMotif)!.extrapolatedTests(aspect: aspect))
                    default: fatalError("Could not decipher motif.")
                }
            }
        }
        return sourceCode
    }
}