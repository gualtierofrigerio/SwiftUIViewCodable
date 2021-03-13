//
//  ContentView.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 02/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

let sampleNode = ViewNode(type: .group, data: nil, children: [], modifiers: [])

struct ContentView: View {
    var nodes:[ViewNode]
    
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
        ViewDecoder.viewsForNodes(nodes)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
