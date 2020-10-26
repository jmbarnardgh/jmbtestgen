public struct Manifest {
    let testableTargetName: String
    let entities: [Entity]
    public static var shared: Manifest? = nil
    public init(testableTargetName: String, entities: [Entity]) {
        self.testableTargetName = testableTargetName
        self.entities = entities
        Manifest.shared = self
    }
}