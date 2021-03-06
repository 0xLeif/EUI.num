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

struct EUILaunchView<Content>: View where Content: View {
    @State private var shouldPresentContent = false
    
    var app: EUIApp
    
    var launchTime: UInt32 = 1
    var launchedView: () -> Content
    
    var body: some View {
        // MARK: SDScreenProvider default
        // ScreenProvider loads Cached Screens with ScreenCacheMonitor
        
        SDScreenProvider.default = app
        
        // MARK: SDScreenStore default
        // UserDefaultScreenStorer is from ScreenDataNavigation
        
        SDScreenStore.default = app
        
        // MARK: SDCustomViews
        // Views that conform to SDCustomizedView
        
        //        SDCustomView.add(customView: LabeledExpandingView())
        //        SDCustomView.add(customView: WelcomeHeaderView())
        //        SDCustomView.add(customView: DividerView())
        //        SDCustomView.add(customView: SectionHeaderView())
        //        SDCustomView.add(customView: LabelledImage())
        //        SDCustomView.add(customView: GalleryImage())
        
        // MARK: Default Colors
        //
        
        //        SDImage.defaultForegroundColor = .white
        
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
        
        SDFont.largeTitleFont = app.fonts.largeTitle
        SDFont.titleFont = app.fonts.title
        SDFont.headlingFont = app.fonts.headline
        SDFont.bodyFont = app.fonts.body
        SDFont.footnoteFont = app.fonts.footnote
        SDFont.captionFont = app.fonts.caption
        
        guard shouldPresentContent else {
            if let launchScreen = app.launchScreen {
                return AnyView(
                    EUIScreenView(screen: launchScreen)
                )
            }
            
            return AnyView(
                ProgressView()
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
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(launchTime)) {
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
        
    }
}
