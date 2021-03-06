//
//  EUITheme.swift
//  
//
//  Created by Leif on 3/6/21.
//

import Foundation

public struct EUITheme {
    public var fonts: EUIFonts
    public var defaultImageForegroundColor: EUIColor?
    
    public init(
        fonts: EUIFonts = EUIFonts(),
        defaultImageForegroundColor: EUIColor? = nil
    ) {
        self.fonts = fonts
        self.defaultImageForegroundColor = defaultImageForegroundColor
    }
}
