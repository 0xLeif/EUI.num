//
//  EUIAppView.swift
//
//
//  Created by Leif on 3/5/21.
//

import SwiftUI

public struct EUIAppView: View {
    public let app: EUIApp
    
    public init(app: EUIApp) {
        self.app = app
    }
    
    public var body: some View {
        EUIScreenView(screen: app.initialScreen)
    }
}
