//
//  ViewType.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 09/03/21.
//  Copyright © 2021 Gualtiero Frigerio. All rights reserved.
//

import Foundation

enum ViewType:String,Codable {
    case group  = "Group"
    case hstack = "HStack"
    case vstack = "VStack"
    case zstack = "ZStack"
    case spacer = "Spacer"
    case text   = "Text"
    
    func needsChildren() -> Bool {
        switch self {
        case .group,.hstack,.vstack,.zstack:
            return true
        default:
            return false
        }
    }
}
