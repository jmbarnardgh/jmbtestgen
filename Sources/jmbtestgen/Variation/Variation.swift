public struct Variation {

    public static var shared: Variation? = nil

    var variableNameModifier: String
    var description: String
    var validityVariableSetting: String = "false"
    var validityExpectation: String
    var value: String


    static var num: Int = 0
    public static func nextNumber() { num = num + 1 }
}