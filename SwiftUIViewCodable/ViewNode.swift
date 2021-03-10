//
//  ViewNode.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 09/03/21.
//  Copyright © 2021 Gualtiero Frigerio. All rights reserved.
//

import Foundation

struct ViewNode: Decodable {
    var type:ViewType
    var data:String?
    var children:[ViewNode]
    var modifiers:[Modifier]
}

extension ViewNode:Identifiable {
    var id:UUID {
        UUID()
    }
}
