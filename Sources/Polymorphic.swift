/**
    This protocol provides syntax for 
    easily accessing values from generic data. 
*/
public protocol Polymorphic {
    var isNull: Bool { get }
    var bool: Bool? { get }
    var float: Float? { get }
    var double: Double? { get }
    var int: Int? { get }
    var string: String? { get }
    var array: [Polymorphic]? { get }
    var object: [String : Polymorphic]? { get }
}
