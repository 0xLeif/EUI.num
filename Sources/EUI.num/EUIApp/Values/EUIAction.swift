//
//  EUIAction.swift
//  
//
//  Created by Leif on 3/5/21.
//

import Chain

public struct EUIAction {
    public let id: String
    public let action: Chain
    
    public init(
        id: String,
        action: Chain
    ) {
        self.id = id
        self.action = action
    }
}
