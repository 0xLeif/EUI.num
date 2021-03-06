//
//  EUIView.swift
//  
//
//  Created by Leif on 3/5/21.
//

import ScreenData

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
