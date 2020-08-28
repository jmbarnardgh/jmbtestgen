import Foundation

extension Manifest {
    public func generate(to relativeOutputDirectory: String) {
        for entity in entities {
            // TODO: Generate a file in the directory for the entity's tests
            Entity.shared = entity
            Entity.nextNumber()
            entity.generate(to: relativeOutputDirectory)
        }
    }
}
