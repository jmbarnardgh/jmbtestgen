public protocol Testable: Quartileable, Vectorable  {

    func quartileTests() -> [String]
    func boundaryTests() -> [String]

}
