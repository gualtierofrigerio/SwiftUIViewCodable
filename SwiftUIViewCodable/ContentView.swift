//
//  ContentView.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 02/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var nodes = [ViewNode(type: .group, children: [ViewNode(type: .text, children: []),
                                                   ViewNode(type: .text, children: [])])]
    var viewDecoder = ViewDecoder()
    
    var body: some View {
        viewDecoder.viewsForNodes(nodes)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
