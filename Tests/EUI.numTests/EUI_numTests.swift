import XCTest
import ScreenData
@testable import EUI_num

final class EUI_numTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let screen = EUIScreen(
            id: "",
            title: "",
            backgroundColor: .green,
            someView: .label(SomeLabel(title: "Hello, World!", font: .title))
        )
        
        XCTAssertEqual(screen.someView.someView.someLabel?.title, "Hello, World?")
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
