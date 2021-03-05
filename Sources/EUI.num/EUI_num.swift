import E
import Chain
import ScreenData
import Observation

import SwiftUI
import ScreenDataUI

public struct EUIScreenView: View {
    public let screen: EUIScreen
    
    public init(screen: EUIScreen) {
        self.screen = screen
    }
    
    public var body: some View {
        SDScreen(
            screen: SomeScreen(
                id: screen.id,
                title: screen.title,
                backgroundColor: screen.backgroundColor.someColor,
                headerView: screen.headerView?.someView,
                someView: screen.bodyView.someView,
                footerView: screen.footerView?.someView
            )
        )
    }
}

public enum EUIView {
    case label(SomeLabel)
    case button(SomeButton)
    
    public var someView: SomeView {
        switch self {
        case .label(let label):
            return label.someView
        case .button(let button):
            return button.someView
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

public class EUIApp {
    @Observed var action: String?
    
    var initialScreen: EUIScreen
    
    var screens: [EUIScreen]
    var actions: [EUIAction]
    
    init(
        initialScreen: EUIScreen,
        screens: [EUIScreen] = [],
        actions: [EUIAction] = []
    ) {
        self.initialScreen = initialScreen
        self.screens = screens
        self.actions = actions
        
        self._action.didChangeHandler = .complete(
            .out { [weak self] in
                guard let euiAction = actions.first(where: { $0.id == self?.action }) else {
                    return .void
                }
                
                let output = euiAction.action.run(name: "EUIAction-\(euiAction.id)",
                                                  input: nil,
                                                  logging: true)
                
                return output
            }
        )
    }
}

public struct EUIScreen {
    public let id: String
    public let title: String
    public let backgroundColor: EUIColor
    public let headerView: EUIView?
    public let bodyView: EUIView
    public let footerView: EUIView?
    
    public init(
        id: String,
        title: String,
        backgroundColor: EUIColor,
        headerView: EUIView? = nil,
        bodyView: EUIView,
        footerView: EUIView? = nil
    ) {
        self.id = id
        self.title = title
        self.backgroundColor = backgroundColor
        self.headerView = headerView
        self.bodyView = bodyView
        self.footerView = footerView
    }
}

public struct EUIAction {
    public let id: String
    public let action: Chain
    
    public init(
        id: String,
        action: Chain
    ) {
        self.id = id
        self.action = action
    }
}

func test() {
    let app = EUIApp(
        initialScreen: EUIScreen(
            id: "init",
            title: "Init Screen",
            backgroundColor: .white,
            headerView: nil,
            bodyView: .label(
                SomeLabel(title: "Hello, World...", font: .title)
            ),
            footerView: nil
        ),
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
                id: "another",
                title: "Another Screen",
                backgroundColor: .white,
                headerView: nil,
                bodyView: .label(
                    SomeLabel(title: "Hello, World!!!", font: .title)
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
