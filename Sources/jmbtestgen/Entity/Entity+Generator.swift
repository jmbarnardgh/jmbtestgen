import Foundation

extension Entity {
    public func generate(to relativeOutputDirectory: String) {
        // TODO: Generate header boilderplate for the member's tests
        for member in members {
            Member.shared = member
            Member.nextNumber()
            Member.resetTestNumberingValueForSubordinates()
            member.generate(to: relativeOutputDirectory)
        }
    }
}