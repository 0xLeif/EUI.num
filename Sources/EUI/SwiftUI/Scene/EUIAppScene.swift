//
//  EUIAppScene.swift
//  EUI
//
//  Created by Leif on 3/5/21.
//

import SwiftUI
import ScreenData

public struct EUIAppScene: Scene {
    public let app: EUIApp
    
    public init(app: EUIApp) {
        self.app = app
    }
    
    public var body: some Scene {
        WindowGroup {
            EUILaunchView(app: app, launchTime: 1) {
                EUIAppInitialView(app: app)
            }
        }
    }
}
