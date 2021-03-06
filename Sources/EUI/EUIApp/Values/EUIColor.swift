//
//  EUIColor.swift
//  
//
//  Created by Leif on 3/5/21.
//

import ScreenData

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
