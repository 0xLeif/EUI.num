//
//  EUIApp.swift
//  
//
//  Created by Leif on 3/5/21.
//

import ScreenData
import ScreenDataNavigation

import Combine

public class EUIApp {
    public var launchScreen: EUIScreen?
    public var initialScreen: EUIScreen
    
    public var screens: [EUIScreen]
    public var actions: [EUIAction]
    public var fonts: EUIFonts
    
    public init(
        launchScreen: EUIScreen? = nil,
        initialScreen: EUIScreen,
        screens: [EUIScreen] = [],
        actions: [EUIAction] = [],
        fonts: EUIFonts = EUIFonts()
    ) {
        self.launchScreen = launchScreen
        self.initialScreen = initialScreen
        self.screens = screens
        self.actions = actions
        self.fonts = fonts
    }
}

enum EUIAppScreenProvidingError: Error {
    case screenNotFound
}

extension EUIApp: ScreenProviding {
    public func screen(forID id: String) -> AnyPublisher<SomeScreen, Error> {
        Future { [weak self] promise in
            guard let screen = self?.screens.first(where: { $0.id == id }) else {
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
