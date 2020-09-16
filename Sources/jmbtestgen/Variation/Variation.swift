/**
  Represents a variation in the parameters of a
  testable aspect of a member according to a motif.

  Example: In boundary testing, one can test that a value
  is right on the boundary. That would be one test variation
  in the boundary testing motif. Another variation would be
  to test just below the boundary.
*/
public struct Variation {

    public static var shared: Variation? = nil

    var variableNameModifier: String
    var description: String
    var validityVariableSetting: String = "false"
    var validityExpectation: String
    var value: String

    static var num: Int = -1
    public static func nextNumber() { num = num + 1 }
}