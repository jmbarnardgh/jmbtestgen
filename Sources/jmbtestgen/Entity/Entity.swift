public struct Entity {

    static var num: Int = 0
    public static func nextNumber() -> Int {
        num = num + 1
        return num
    }

    public static var current: Entity? = nil

    public var name: String
    public var members: [Member]
    public init(name: String, members: [Member]) {
        self.name = name
        self.members = members
    }
}