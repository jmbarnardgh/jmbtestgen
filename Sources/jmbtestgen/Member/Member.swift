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

    public init(name: String, type: MemberType, description: String, tryable: Bool, aspects: [Aspect]) {
        self.name = name
        self.type = type
        self.description = description
        self.tryable = tryable
        self.aspects = aspects
    }

    static var num: Int = 0
    public static func nextNumber() -> Int {
        num = num + 1
        return num
    }

    public enum AspectDataType {
        case boolean
        case int
        case float
        case string
        case object
    }

    public enum AspectRole {
        case parameter
        case output
        case value
        case reference
    }

    public struct Aspect {
        var name: String
        var role: AspectRole
        var dataType: AspectDataType
        var motifs: [Motif]

        static var num: Int = 0
        public static func nextNumber() -> Int {
            num = num + 1
            return num
        }
        
        public init(name: String, role: AspectRole, dataType: AspectDataType, motifs: [MotifType]) {
            self.name = name
            self.role = role
            self.dataType = dataType
            self.motifs = [Motif]()
            for type in motifs {
                let motif = MotifFactory.motif(for: type)
                self.motifs.append(motif)
            }
        }
    }
}
