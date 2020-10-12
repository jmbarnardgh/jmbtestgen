/**
    A testable aspect of a Member, such as a boundary, conformity, binding,
    size specification, whether or not the value is nil, etc. 
    */
public struct Aspect {
    
    var name: String
    var role: AspectRole
    var dataType: AspectDataType
    var motifs: [Motif]

    public static var num: Int = -1

    public static func nextNumber() {
        num = num + 1
        resetTestNumberingValueForSubordinates()
    }

    public static func resetTestNumberingValueForSubordinates() {
        Variation.num = -1
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

/**
    Data type of an `Aspect`
*/
public enum AspectDataType {
    case boolean
    case int
    case float
    case string
    case object
}

/**
    The role of an aspect, such as `parameter`, `output`, `instance` variable,
    `reference` variable, etc.
*/
public enum AspectRole {
    case parameter
    case output
    case value
    case reference
}