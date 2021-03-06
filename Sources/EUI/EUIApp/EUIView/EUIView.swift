//
//  EUIView.swift
//  
//
//  Created by Leif on 3/5/21.
//

import ScreenData

public enum EUIView {
    case label(SomeLabel)
    case image(SomeImage)
    case button(SomeButton)
    case container(SomeContainerView)
    case custom(SomeCustomView)
    case spacer(SomeSpacer)
    case text(SomeText)
    
    public var someView: SomeView {
        switch self {
        case .label(let label):
            return label.someView
        case .image(let image):
            return image.someView
        case .button(let button):
            return button.someView
        case .container(let container):
            return container.someView
        case .custom(let custom):
            return custom.someView
        case .spacer(let spacer):
            return spacer.someView
        case .text(let text):
            return text.someView
        }
    }
}
