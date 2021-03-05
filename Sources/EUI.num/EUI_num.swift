import E
import Chain
import ScreenData

public enum EUIView {
    case label(SomeLabel)
}

public extension SomeView {
    init(_ view: EUIView) {
        switch view {
        case .label(let label):
            self = label.someView
        }
    }
}

public enum EUIColor {
    case clear
    case white
    case black
    
    case red
    case green
    case blue
    
    case custom(SomeColor)
    
    public var someColor: SomeColor {
        switch self {
        case .clear:
            return SomeColor(red: 0, green: 0, blue: 0, alpha: 0)
        case .white:
            return SomeColor(red: 1, green: 1, blue: 1)
        case .black:
            return SomeColor(red: 0, green: 0, blue: 0)
        case .red:
            return SomeColor(red: 1, green: 0, blue: 0)
        case .green:
            return SomeColor(red: 0, green: 1, blue: 0)
        case .blue:
            return SomeColor(red: 0, green: 0, blue: 1)
        case .custom(let color):
            return color
        }
    }
}

public struct EUIApp {
    var screens: [EUIScreen]
    var actions: [EUIAction]
}

public struct EUIScreen {
    let id: String
    let title: String
    let backgroundColor: EUIColor
    let headerView: EUIView?
    let someView: EUIView
    let footerView: EUIView?
}

public struct EUIAction {
    let id: String
    let action: Chain
}

func test() {
    let app = EUIApp(
        screens: [
            //            SomeScreen(
            //                id: "init",
            //                title: "Init Screen",
            //                backgroundColor: .init(red: 1, green: 1, blue: 1),
            //                headerView: nil,
            //                someView: SomeView(
            //                    .label(
            //                        SomeLabel(title: "Hello, World...", font: .title)
            //                    )
            //                ),
            //                footerView: nil
            //            )
            EUIScreen(
                id: "init",
                title: "Init Screen",
                backgroundColor: .white,
                headerView: nil,
                someView: .label(
                    SomeLabel(title: "Hello, World...", font: .title)
                ),
                footerView: nil
            )
        ],
        actions: [
            EUIAction(
                id: "print",
                action: .complete(
                    .void {
                        print("Hello, World!")
                    }
                )
            )
            //            "print": .void {
            //                print("Hello, World!")
            //            }
        ]
    )
}
