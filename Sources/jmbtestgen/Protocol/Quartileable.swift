/**
 A protocol that, when adopted, gives the adopting entity the ability
 to be "quartiled" - that is, an object of the adopting entity can 
 provide the caller of `quartiles` with 
 */
public protocol Quartileable {

    associatedtype QuartileableContent
    associatedtype Quartile

    var quartileableContent: QuartileableContent { get }
    func quartiles() -> [Quartile]

}
