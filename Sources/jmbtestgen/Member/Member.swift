/**
 A member of an `Entity`, such as a method, variable, etc.
 
  - see `MemeberType`
 */
public struct Member {
    public var name: String
    public var type: MemberType
    public var description: String
    public var tryable: Bool

    public var aspects: [Aspect]

    public static var shared: Member? = nil

    public init(name: String, type: MemberType, description: String, tryable: Bool, aspects: [Aspect]) {
        self.name = name
        self.type = type
        self.description = description
        self.tryable = tryable
        self.aspects = aspects
    }

    static var num: Int = -1
    public static func nextNumber() {
        num = num + 1
        resetTestNumberingValueForSubordinates()
    }

    public static func resetTestNumberingValueForSubordinates() {
        Aspect.num = -1
        Aspect.resetTestNumberingValueForSubordinates()
    }
}

public enum MemberType {
    case method
    case variable
}