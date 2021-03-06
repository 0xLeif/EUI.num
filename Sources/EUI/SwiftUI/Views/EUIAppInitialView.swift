//
//  EUIAppInitialView.swift
//
//
//  Created by Leif on 3/5/21.
//

import SwiftUI

public struct EUIAppInitialView: View {
    @Binding public var app: EUIApp
    
    public init(app: Binding<EUIApp>) {
        self._app = app
    }
    
    public var body: some View {
        NavigationView {
            EUIScreenView(screen: $app.initialScreen)
        }
    }
}
