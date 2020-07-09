import Foundation

extension TestSuiteEntity {
    public func generate(to relativeOutputDirectory: String) {
        // TODO: Generate header boilderplate for the member's tests
        for member in members {
            member.generate(to: relativeOutputDirectory)
        }
    }
}