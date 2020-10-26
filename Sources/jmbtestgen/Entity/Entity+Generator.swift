import Foundation

extension Entity {
    public func generate(to relativeOutputDirectory: String) {
        for member in members {
            Member.shared = member
            Member.nextNumber()
            Member.resetTestNumberingValueForSubordinates()
            member.generate(to: relativeOutputDirectory)
        }
    }
}