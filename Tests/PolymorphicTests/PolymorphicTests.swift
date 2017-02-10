import XCTest
@testable import Polymorphic

class PolymorphicTests: XCTestCase {
    static var allTests = [
        ("testInt", testInt),
        ("testUInt", testUInt),
        ("testArray", testArray),
        ("testObject", testObject),
        ("testFloat", testFloat),
        ("testDouble", testDouble),
        ("testNull", testNull),
        ("testBool", testBool),
        ("testDefaults", testDefaults),
    ]

    func testInt() {
        let poly = "-123"
        XCTAssert(poly.int == -123)
        XCTAssert(poly.uint == nil)
        XCTAssert(poly.string == "-123")
    }

    func testUInt() {
        let poly = UInt.max.description
        XCTAssert(poly.uint == UInt.max)
        XCTAssert(poly.int == nil)
    }

    func testArray() {
        let list = "oranges, apples , bananas, grapes"
        let fruits = list.array?.flatMap { $0.string } ?? []
        XCTAssert(fruits == ["oranges", "apples", "bananas", "grapes"])
    }

    func testObject() {
        let obstr = "***"
        XCTAssert(obstr.object == nil)
    }

    func testFloat() {
        let poly = "3.14159"
        XCTAssert(poly.float == 3.14159)
    }

    func testDouble() {
        let poly = "999999.999"
        XCTAssert(poly.double == 999_999.999)
    }

    func testNull() {
        XCTAssert("null".isNull == true)
        XCTAssert("NULL".isNull == true)
    }

    func testBool() {
        XCTAssert("y".bool == true)
        XCTAssert("yes".bool == true)
        XCTAssert("t".bool == true)
        XCTAssert("true".bool == true)
        XCTAssert("1".bool == true)
        XCTAssert("on".bool == true)


        XCTAssert("n".bool == false)
        XCTAssert("no".bool == false)
        XCTAssert("f".bool == false)
        XCTAssert("false".bool == false)
        XCTAssert("0".bool == false)
        XCTAssert("off".bool == false)

        XCTAssert("nothing".bool == nil)
        XCTAssert("to".bool == nil)
        XCTAssert("see".bool == nil)
        XCTAssert("here".bool == nil)
    }

    func testDefaults() {
        struct Test: Polymorphic {
            var int: Int?
            var double: Double?

            var isNull: Bool { return false }
            var bool: Bool? { return nil }
            var string: String? { return nil }
            var array: [Polymorphic]? { return nil }
            var object: [String : Polymorphic]? { return nil }
            var bytes: [UInt8]? { return nil }
        }

        var a = Test(int: 42, double: 3.14159)
        XCTAssertEqual(a.uint, 42)
        XCTAssertEqual(a.float, 3.14159)
        a.double = nil
        XCTAssertEqual(a.float, nil)

        let b = Test(int: nil, double: nil)
        XCTAssert(b.uint == nil)

        let c = Test(int: -123, double: nil)
        XCTAssert(c.uint == nil)
    }

    func testBytes() {
        let expectation = [0x48, 0x65, 0x6C, 0x6C, 0x6F, 0x2C, 0x20, 0x57, 0x6F, 0x72, 0x6C, 0x64, 0x20, 0xF0, 0x9F, 0x91, 0x8B] as [UInt8]
        let input = "Hello, World 👋".bytes
        XCTAssertEqual(expectation, input ?? [])
    }
}
