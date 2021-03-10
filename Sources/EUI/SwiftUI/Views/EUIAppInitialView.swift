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
            ZStack {
                EUIScreenView(screen: $app.initialScreen)
                
                if app.debug {
                    VStack {
                        Text("Total Number of Screens: \(app.screens.count)")
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
