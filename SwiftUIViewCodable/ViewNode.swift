//
//  ViewNode.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 09/03/21.
//  Copyright © 2021 Gualtiero Frigerio. All rights reserved.
//

import Foundation

/// Struct used to configure a SwiftUI View from a JSON
struct ViewNode: Decodable {
    var type:ViewType // the view type (VStack, Text, Image etc.)
    var data:String? // optional data for the particular view
    var children:[ViewNode] // array of children (for Group, VStack etc.)
    var modifiers:[Modifier] // array of modifiers applied via CustomModifier
}

extension ViewNode:Identifiable {
    var id:UUID {
        UUID()
    }
}
