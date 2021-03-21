//
//  ViewDecoder.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 03/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import SwiftUI

/// VIewDecoder contains static functions to get a SwiftUI View
/// from a ViewNode or an array of ViewNode
struct ViewDecoder {
    
    /// Returns a View from a ViewNode
    /// - Parameter node: The ViewNode describing the view to create
    /// - Returns: A View configured by the ViewNode
    static func viewForNode(_ node:ViewNode) -> some View {
        let childrenView = ChildrenView(nodes:node.children)
        
        @ViewBuilder var returnView: some View {
            switch node.type {
            case .group:
                Group { childrenView }
            case .hstack:
                HStack { childrenView }
            case .vstack:
                VStack { childrenView }
            case .zstack:
                ZStack { childrenView }
            case .spacer:
                Spacer()
            case .text:
                if let data = node.data {
                    Text(data)
                }
                else {
                    Text("...")
                }
            case .image:
                if let data = node.data {
                    Image(data)
                }
                else {
                    Text("no image data provided")
                }
            }
        }
        return returnView.modifier(CustomModifier(withModifiers: node.modifiers))
    }
    
    /// Returns a View from an array of ViewNode
    /// - Parameter nodes: The array of ViewNode composing the view
    /// - Returns: The View configured by the ViewNode array
    static func viewsForNodes(_ nodes:[ViewNode]) -> some View {
        ChildrenView(nodes:nodes)
    }
}

// MARK: - ChildrenView

/// To avoid a compiler error I created this struct to contain all the children
/// If I don't and try to call viewForNode inside viewFromNodes I get the error
/// during build
fileprivate struct ChildrenView: View {
    let nodes:[ViewNode]
    
    var body: some View {
        ForEach(nodes) { node in
            ViewDecoder.viewForNode(node)
        }
    }
}
