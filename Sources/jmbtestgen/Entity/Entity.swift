public struct Entity {

    static var num: Int = 0
    public static func nextNumber() {
        num = num + 1
    }

    public static var shared: Entity? = nil

    public var name: String
    public var members: [Member]
    
    public init(name: String, members: [Member]) {
        self.name = name
        self.members = members
    }
}