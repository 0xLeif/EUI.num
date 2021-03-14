//
//  EUIFonts.swift
//  
//
//  Created by Leif on 3/5/21.
//

import ScreenData

import SwiftUI

public struct EUIFonts {
    public var largeTitle: Font?
    public var title: Font?
    public var headline: Font?
    public var body: Font?
    public var footnote: Font?
    public var caption: Font?
    
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
