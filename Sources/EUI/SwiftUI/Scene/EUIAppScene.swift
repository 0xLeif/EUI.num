//
//  EUIAppScene.swift
//  EUI
//
//  Created by Leif on 3/5/21.
//

import SwiftUI
import ScreenData
import Chain

public struct EUIAppScene: Scene {
    @Binding public var app: EUIApp
    
    public var initialLoadChain: Chain?
    public var onAppearChain: Chain?
    
    public init(
        app: Binding<EUIApp>,
        initialLoadChain: Chain? = nil,
        onAppearChain: Chain? = nil
    ) {
        self._app = app
        self.initialLoadChain = initialLoadChain
        self.onAppearChain = onAppearChain
    }
    
    public var body: some Scene {
        WindowGroup {
            EUILaunchView(app: $app, launchChain: initialLoadChain) {
                EUIAppInitialView(app: $app)
                    .onAppear {
                        _ = onAppearChain?.run(name: "EUIAppInitialView.onAppearChain", logging: true)
                    }
            }
        }
    }
}
