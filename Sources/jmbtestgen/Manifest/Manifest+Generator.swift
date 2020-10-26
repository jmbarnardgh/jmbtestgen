import Foundation

extension Manifest {
    public func generate(to relativeOutputDirectory: String) {
        for entity in entities {
            Entity.shared = entity
            Entity.nextNumber()
            entity.generate(to: relativeOutputDirectory + "/" + entity.name)
        }
    }
}
