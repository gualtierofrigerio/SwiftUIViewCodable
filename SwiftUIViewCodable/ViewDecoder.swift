//
//  ViewDecoder.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 03/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import SwiftUI

struct ViewDecoder {
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
            }
        }
        return returnView
    }
    
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
