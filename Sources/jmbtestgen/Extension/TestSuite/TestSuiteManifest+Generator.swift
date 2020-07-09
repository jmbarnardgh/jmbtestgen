import Foundation

extension TestSuiteManifest {
    public func generate(to relativeOutputDirectory: String) {
        for entity in entities {
            // TODO: Generate a file in the directory for the entity's tests
            entity.generate(to: relativeOutputDirectory)
        }
    }
}