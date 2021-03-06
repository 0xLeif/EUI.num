//
//  EUICustomView.swift
//  
//
//  Created by Leif on 3/6/21.
//

import SwiftUI
import ScreenData
import ScreenDataUI

public struct EUICustomView<Content>: SDCustomizedView where Content: View {
    private var _id: String
    public var id: String {
        _id
    }
    
    public var content: Content
    
    public init(id: String, content: () -> Content) {
        self._id = id
        self.content = content()
    }

    public func view(forSomeCustomView customView: SomeCustomView) -> AnyView {
        AnyView(content)
    }
}
