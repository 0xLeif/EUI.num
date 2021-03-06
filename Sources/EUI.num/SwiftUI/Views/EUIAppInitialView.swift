//
//  EUIAppInitialView.swift
//
//
//  Created by Leif on 3/5/21.
//

import SwiftUI

public struct EUIAppInitialView: View {
    public let app: EUIApp
    
    public init(app: EUIApp) {
        self.app = app
    }
    
    public var body: some View {
        NavigationView {
            EUIScreenView(screen: app.initialScreen)
        }
    }
}
