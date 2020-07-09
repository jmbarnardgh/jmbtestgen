/**
 A generic vector with direction, magnitude and content.
 */
public protocol Vectorable  {

    associatedtype Direction
    associatedtype Magnitude
    associatedtype ContentType

    var vectorContent: ContentType { get }
    var vectorDirection: Direction { get }
    var vectorMagnitude: Magnitude { get }
    
}