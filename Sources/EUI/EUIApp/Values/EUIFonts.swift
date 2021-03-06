//
//  EUIFonts.swift
//  
//
//  Created by Leif on 3/5/21.
//

import ScreenData

import SwiftUI

public struct EUIFonts {
    public let largeTitle: Font?
    public let title: Font?
    public let headline: Font?
    public let body: Font?
    public let footnote: Font?
    public let caption: Font?
    
    public init(
        largeTitle: Font? = nil,
        title: Font? = nil,
        headline: Font? = nil,
        body: Font? = nil,
        footnote: Font? = nil,
        caption: Font? = nil
    ) {
        self.largeTitle = largeTitle
        self.title = title
        self.headline = headline
        self.body = body
        self.footnote = footnote
        self.caption = caption
    }
}
