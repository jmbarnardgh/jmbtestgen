extension String: Testable {

    public typealias LimitableType = String
    public typealias LimitType = String.Index
  
    public typealias Direction = GrowthDirection
    public typealias Magnitude = Int
    public typealias ContentType = Self
    
    public typealias QuartileableContent = Self
    public typealias Quartile = Self

    public var quartileableContent: QuartileableContent {
        return self
    }

    public func quartiles() -> [Quartile] {
        var quartiles: [Self] = []
        for i in 1...4 {
            let iDouble = Double(i)
            let percentage = Double(0.25)
            let quartilePercentage = iDouble * percentage
            let countDouble = Double(count)
            let quartileCountDouble = quartilePercentage * countDouble
            let quartileCountInt = Int(quartileCountDouble)
            let startIndex = self.startIndex
            let endIndex = self.index(startIndex, offsetBy: quartileCountInt - 1)
            let quartileSubsequence = self[startIndex...endIndex]
            let quartileString = String(quartileSubsequence)
            quartiles.append(quartileString)
        }
        return quartiles
    }

    public var vectorMagnitude: Magnitude   { return count }
    public var vectorDirection: Direction   { return .grow }
    public var vectorContent:   ContentType { return self  }

    public var limitableContent: String { return self }

    // Default is one lower-bound limit: the start index.
    public func limits() -> [LimitType] { return [limitableContent.startIndex] }

    
    public func quartileTests() -> [String] { 
        // TODO: Finish implementation...
        return quartiles()
    }

    public func boundaryTests() -> [String] {
        // TODO: Finish implementation...
        return []
    }
}

infix operator .-.

extension String {   

    static func - (left: String, right: String) throws -> String {
        guard right.vectorMagnitude <= left.vectorMagnitude else {
            throw StringVectorError(message: "Right-side vector \(right) too large to be subtracted from left-side vector \(left)")
        }
        var leftContent = left.vectorContent
        let rightReversedContent = right.vectorContent.reversed()
        for chr in rightReversedContent {
            if leftContent.count == 0 { break }
            let lastIndexOnLeft = leftContent.endIndex
            let lastLeftCharacterIndex = leftContent.index(before: lastIndexOnLeft)
            let lastLeftChar = leftContent[lastLeftCharacterIndex]
            if chr == lastLeftChar {
                leftContent = String(leftContent.dropLast())
            } else {
                throw StringVectorError(message: "Right-side vector \(right) does not match tail substring of left-side vector \(left).")
            }
        }
        let resultantVector = String(leftContent)
        return resultantVector
    }
}
