public struct StringLengthTestMotif: TestMotif {

    /**
     Used as `settings` to conform to the `TestMotif` protocol.
     `StringLengthTestMotif` expects at least one boundary...
     either an upper-bound or lower-bound index as an Int. The
     maximum number of boundaries permitted is 2.

      - example: `["upper": 23]`
      - example: `["lower": 12]`
      - example: `["upper": 23, "lower": 12]`
     */
    private var lowerBound: UInt
    private var upperBound: UInt
    private let motifType: TestMotifType

    public var type: TestMotifType { return motifType }

    init(_ motifType: TestMotifType) {
        switch motifType {
        case .lengthBoundaries(let l, let u): 
            self.lowerBound = l
            self.upperBound = u
            self.motifType = motifType
        default: fatalError("Cannot init StringLengthTestMotif with non-lengthBoundaries motif type.")
        }
    }

}