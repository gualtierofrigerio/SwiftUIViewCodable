//
//  ContentView.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 02/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

//let sampleNode = ViewNode(type: .group,
//                          children: ContentView.makeNodes(),
//                          modifiers: [])

let sampleNode = ViewNode(type: .group, data: nil, children: [], modifiers: [])

struct ContentView: View {
    var nodes:[ViewNode]
    var viewDecoder = ViewDecoder()
    
    init() {
        if let url = Bundle.main.url(forResource: "Views", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let node = JSONHelper.node(fromData: data) {
            self.nodes = [node]
        }
        else {
            nodes = [sampleNode]
        }
    }
    
    var body: some View {
        viewDecoder.viewsForNodes(nodes)
    }
}

extension ContentView {
    static func makeNodes() -> [ViewNode] {
        /*
        let textNode1 = ViewNode(type: .text, data:"Test!", children: [], modifiers: [.font(size: 30)])
        let textNode2 = ViewNode(type: .text, children: [], modifiers: [.font(size: 10)])
        return [textNode1, textNode2]
        */
        return []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
