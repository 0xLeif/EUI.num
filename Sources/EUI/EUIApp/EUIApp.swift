//
//  EUIApp.swift
//  
//
//  Created by Leif on 3/5/21.
//

import ScreenData
import ScreenDataNavigation

import Combine
import SwiftUI

public struct EUIApp {
    public var launchScreen: EUIScreen?
    public var launchScreenDuration: UInt32
    
    public var initialScreen: EUIScreen
    
    public var screens: [EUIScreen]
    public var customViews: [EUICustomView<AnyView>]
    public var actions: [EUIAction]
    public var theme: EUITheme
    
    public init(
        launchScreen: EUIScreen? = nil,
        launchScreenDuration: UInt32 = 1,
        initialScreen: EUIScreen,
        screens: [EUIScreen] = [],
        customViews: [EUICustomView<AnyView>] = [],
        actions: [EUIAction] = [],
        theme: EUITheme = EUITheme()
    ) {
        self.launchScreen = launchScreen
        self.launchScreenDuration = launchScreenDuration
        self.initialScreen = initialScreen
        self.screens = screens
        self.customViews = customViews
        self.actions = actions
        self.theme = theme
    }
}

enum EUIAppScreenProvidingError: Error {
    case screenNotFound
}

extension EUIApp: ScreenProviding {
    public func screen(forID id: String) -> AnyPublisher<SomeScreen, Error> {
        Future { promise in
            guard let screen = self.screens.first(where: { $0.id == id }) else {
                promise(.failure(EUIAppScreenProvidingError.screenNotFound))
                return
            }
            
            promise(.success(SomeScreen(
                id: screen.id,
                title: screen.title,
                backgroundColor: screen.backgroundColor.someColor,
                headerView: screen.headerView?.someView,
                someView: screen.bodyView.someView,
                footerView: screen.footerView?.someView
            )))
        }
        .eraseToAnyPublisher()
    }
}

extension EUIApp: ScreenStoring {
    public func store(screens: [SomeScreen]) -> AnyPublisher<Void, Error> {
        Future { $0(.success(())) }
            .eraseToAnyPublisher()
    }
}
