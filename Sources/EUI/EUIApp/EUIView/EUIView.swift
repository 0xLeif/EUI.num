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

public extension EUIView {
    init(someView: SomeView) {
        switch someView.type {
        case .label:
            self = EUIView.label(someView.someLabel!)
        case .image:
            self = EUIView.image(someView.someImage!)
        case .button:
            self = EUIView.button(someView.someButton!)
        case .container:
            self = EUIView.container(someView.someContainer!)
        case .custom:
            self = EUIView.custom(someView.someCustomView!)
        case .spacer:
            self = EUIView.spacer(someView.someSpacer!)
        case .text:
            self = EUIView.text(someView.someText!)
        }
    }
}
