//
//  EUILaunchView.swift
//
//
//  Created by Leif on 3/5/21.
//

import SwiftUI

import ScreenData
import ScreenDataUI
import ScreenDataNavigation

import Chain

struct EUILaunchView<Content>: View where Content: View {
    @State private var shouldPresentContent = false
    
    @Binding var app: EUIApp
    var launchChain: Chain?
    var launchedView: () -> Content
    
    private var launchView: some View {
        if let launchScreen = app.launchScreen,
           let boundScreen = Binding<EUIScreen>(State(initialValue: launchScreen).projectedValue) {
            return AnyView(EUIScreenView(screen: boundScreen))
        }
        
        return AnyView(ProgressView())
    }
    
    var body: some View {
        // MARK: SDScreenProvider default
        // ScreenProvider loads Cached Screens with ScreenCacheMonitor
        
        SDScreenProvider.default = app
        
        // MARK: SDScreenStore default
        // UserDefaultScreenStorer is from ScreenDataNavigation
        
        SDScreenStore.default = app
        
        // MARK: SDCustomViews
        // Views that conform to SDCustomizedView
        
        app.customViews.forEach(SDCustomView.add(customView:))
        
        // MARK: Default Colors
        //
        
        if let defaultForegroundColor = app.theme.defaultImageForegroundColor {
            SDImage.defaultForegroundColor = Color(
                UIColor(red: CGFloat(defaultForegroundColor.someColor.red),
                        green: CGFloat(defaultForegroundColor.someColor.green),
                        blue: CGFloat(defaultForegroundColor.someColor.blue),
                        alpha: CGFloat(defaultForegroundColor.someColor.alpha))
            )
        } else {
            SDImage.defaultForegroundColor = .gray
        }
        
        // MARK: SDButton Actions
        //
        
        app.actions.forEach { euiAction in
            SDButton.add(actionWithID: euiAction.id) {
                _ = euiAction.action.run(name: "EUIAction-\(euiAction.id)",
                                         input: nil,
                                         logging: true)
            }
        }
        
        // MARK: SDFont Values
        //
        
        SDFont.largeTitleFont = app.theme.fonts.largeTitle
        SDFont.titleFont = app.theme.fonts.title
        SDFont.headlingFont = app.theme.fonts.headline
        SDFont.bodyFont = app.theme.fonts.body
        SDFont.footnoteFont = app.theme.fonts.footnote
        SDFont.captionFont = app.theme.fonts.caption
        
        guard shouldPresentContent else {
            return AnyView(
                launchView
                    .padding()
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .center)
                    .background(Color(red: 1,
                                      green: 1,
                                      blue: 1))
                    .ignoresSafeArea(.all, edges: .all)
                    .onAppear {
                        
                        // MARK: Wait `launchTime`
                        //
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(app.launchScreenDuration)) {
                            shouldPresentContent = true
                        }
                        
                        fetchInitialData()
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                        fetchInitialData()
                    }
            )
        }
        
        return AnyView(
            launchedView()
        )
    }
    
    func fetchInitialData() {
        _ = launchChain?.run(name: "EUILaunchView.launchChain", logging: true)
    }
}
