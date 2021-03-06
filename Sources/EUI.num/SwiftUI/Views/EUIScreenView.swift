//
//  EUIScreenView.swift
//
//
//  Created by Leif on 3/5/21.
//

import ScreenData

import ScreenDataUI
import SwiftUI

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
