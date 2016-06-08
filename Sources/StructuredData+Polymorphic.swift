extension StructuredData: Polymorphic {
    /**
        Attempts to convert the StructuredData
        to a `String`. The conversion **will** succeed for
        `.bool`, `.int`, `.double`, and of course `.string`.

        All others will always return `nil`.
    */
    public var string: String? {
        switch self {
        case .bool(let bool):
            return "\(bool)"
        case .int(let int):
            return "\(int)"
        case .double(let double):
            return "\(double)"
        case .string(let string):
            return string
        default:
            return nil
        }
    }

    /**
        Attempts to convert the StructuredData
        to an `Int`. The conversion **may** succeed for
        `.string`, `.double`, `.bool` and of course `.int`.

        All others will always return `nil`.
    */
    public var int: Int? {
        switch self {
        case .int(let int):
            return int
        case .string(let string):
            return string.int
        case .double(let double):
            return Int(double)
        case .bool(let bool):
            return bool ? 1 : 0
        default:
            return nil
        }
    }

    /**
        Attempts to convert the StructuredData
        to a `Double`. The conversion **may** succeed for
        `.string`, `.int`, `.bool` and of course `.double`.

        All others will always return `nil`.
    */
    public var double: Double? {
        switch self {
        case .double(let double):
            return double
        case .string(let string):
            return string.double
        case .int(let int):
            return Double(int)
        case .bool(let bool):
            return bool ? 1.0 : 0.0
        default:
            return nil
        }
    }

    /**
        Determines whether or not the 
        StructuredData is null.

        Cases `.null` and `.string` may return `true`. 
        All others will always return `false`.
    */
    public var isNull: Bool {
        switch self {
        case .null:
            return true
        case .string(let string):
            return string.isNull
        default:
            return false
        }
    }

    /**
        Attempts to convert the StructuredData
        to a `Bool`. The conversion **may** succeed for
        `.bool`, `.int`, `.double`, `.string`, `.null` and 
        of course `.bool`.

        All others will always return `nil`.
    */
    public var bool: Bool? {
        switch self {
        case .bool(let bool):
            return bool
        case .int(let int):
            switch int {
            case 1:
                return true
            case 0:
                return false
            default:
                return nil
            }
        case .double(let double):
            switch double {
            case 1.0:
                return true
            case 0.0:
                return false
            default:
                return nil
            }
        case .string(let string):
            return string.bool
        case .null:
            return false
        default:
            return nil
        }
    }

    /**
        Attempts to convert the StructuredData
        to a `Float`. The conversion **may** succeed for
        `.string`, `.int`, `.bool` and `.double`.

        All others will always return `nil`.
    */
    public var float: Float? {
        switch self {
        case .double(let double):
            return Float(double)
        case .string(let string):
            return string.float
        case .int(let int):
            return Float(int)
        case .bool(let bool):
            return bool ? 1.0 : 0.0
        default:
            return nil
        }
    }

    /**
        Attempts to convert the StructuredData
        to an `Array`. The conversion **may** succeed for
        `.string` ("1, 2, 3") of course `.array`.

        All others will always return `nil`.
    */
    public var array: [Polymorphic]? {
        switch self {
        case .array(let array):
            return array.map { $0 }
        case .string(let string):
            return string.array
        default:
            return nil
        }
    }

    /**
        Attempts to convert the StructuredData
        to a `Dictionary`. The conversion will only succeed for
        `.dictionary`.

        All others will always return `nil`.
    */
    public var object: [String: Polymorphic]? {
        switch self {
        case .dictionary(let dict):
            var object: [String: Polymorphic] = [:]

            dict.forEach { (key, value) in
                object[key] = value
            }

            return object
        default:
            return nil
        }
    }
}
