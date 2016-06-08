extension String: Polymorphic {
    /**
        Determines whether or not the `String` is null.
        Returns `true` if the `String` is equal to `"null"`.
    */
    public var isNull: Bool {
        return self == "null"
    }

    /**
        Attempts to convert the String to a `Bool`. 
        The conversion **may** succeed if the `String`
        has a truthy/falsey value like `"yes"` or `"false"`

        All others will always return `nil`.
    */
    public var bool: Bool? {
        switch lowercased() {
        case "y", "1", "yes", "true":
            return true
        case "n", "0", "no", "false":
            return false
        default:
            return nil
        }
    }

    /**
        Attempts to convert the `String` to a `Float`. 
        The conversion uses the `Float(_: String)` initializer.
    */
    public var float: Float? {
        return Float(self)
    }

    /**
        Attempts to convert the `String` to a `Double`. 
        The conversion uses the `Double(_: String)` initializer.
    */
    public var double: Double? {
        return Double(self)
    }

    /**
        Attempts to convert the `String` to a `Int`. 
        The conversion uses the `Int(_: String)` initializer.
    */
    public var int: Int? {
        return Int(self)
    }

    /**
        Attempts to convert the `String` to a `String`.
        This always works.
    */
    public var string: String? {
        return self
    }

    /**
        Attempts to convert the `String` to an `Array`.
        Comma separated items will be split into
        multiple entries.
    */
    public var array: [Polymorphic]? {
        return characters.split(separator: ",").map(String.init).map { $0 }
    }

    /**
        Attempts to convert the `String` to a `Dictionary`.
        This conversion always fails.
    */
    public var object: [String : Polymorphic]? {
        return nil
    }
}
