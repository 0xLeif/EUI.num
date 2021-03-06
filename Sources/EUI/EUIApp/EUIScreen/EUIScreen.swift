//
//  EUIScreen.swift
//  
//
//  Created by Leif on 3/5/21.
//

import ScreenData

public struct EUIScreen {
    public let id: String
    public var title: String
    public var backgroundColor: EUIColor
    public var headerView: EUIView?
    public var bodyView: EUIView
    public var footerView: EUIView?
    
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

public extension EUIScreen {
    init?(someScreen: SomeScreen) {
        guard let id = someScreen.id else {
            return nil
        }
        
        self = EUIScreen(
            id: id,
            title: someScreen.title,
            backgroundColor: EUIColor.custom(someScreen.backgroundColor),
            headerView: someScreen.headerView.map(EUIView.init(someView:)),
            bodyView: EUIView(someView: someScreen.someView),
            footerView: someScreen.footerView.map(EUIView.init(someView:))
        )
    }
}
