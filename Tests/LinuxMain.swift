#if os(Linux)

    import XCTest
    @testable import PolymorphicTestSuite

XCTMain([
    testCase(PolymorphicTests.allTests)
    ])
    
#endif
