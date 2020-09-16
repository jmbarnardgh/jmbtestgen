public struct Entity {

    static var num: Int = -1
    public static func nextNumber() {
        num = num + 1
        resetTestNumberingValueForSubordinates()
    }
    
    public static func resetTestNumberingValueForSubordinates() {
        Member.num = -1
        Member.resetTestNumberingValueForSubordinates()
    }

    public static var shared: Entity? = nil

    public var name: String
    public var members: [Member]
    
    public init(name: String, members: [Member]) {
        self.name = name
        self.members = members
    }
}