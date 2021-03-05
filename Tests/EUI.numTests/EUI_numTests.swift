import XCTest
import ScreenData
@testable import EUI_num

final class EUI_numTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        _ = SomeView(
            .label(
                SomeLabel(
                    title: "Hello, World!", font: .title
                )
            )
        )
//        XCTAssertEqual(someView, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
