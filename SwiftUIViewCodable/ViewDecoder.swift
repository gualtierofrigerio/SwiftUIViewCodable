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
    func viewForNode(_ node:ViewNode) -> some View {
        let childrenView = viewsForNodes(node.children)
        
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
        return AnyView(returnView) // build error if I return returnView without casting to AnyView
    }
    
    func viewsForNodes(_ nodes:[ViewNode]) -> some View {
        ForEach(nodes) { node in
            self.viewForNode(node)
        }
    }
}
