public struct TestSuiteMember {
    public var name: String
    public var type: TestSuiteMemberType
    public var description: String
    public var tryable: Bool

    public var aspects: [TestAspect]
}