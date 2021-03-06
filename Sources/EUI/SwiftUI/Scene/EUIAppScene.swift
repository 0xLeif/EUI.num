//
//  EUIAppScene.swift
//  EUI
//
//  Created by Leif on 3/5/21.
//

import SwiftUI
import ScreenData

public struct EUIAppScene: Scene {
    @Binding public var app: EUIApp
    
    public init(app: Binding<EUIApp>) {
        self._app = app
    }
    
    public var body: some Scene {
        WindowGroup {
            EUILaunchView(app: app) {
                EUIAppInitialView(app: app)
            }
        }
    }
}
