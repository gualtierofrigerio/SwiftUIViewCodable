//
//  Modifier.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 02/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

enum Modifier {
    case background(color:Color)
    case font(size:CGFloat)
    case null
}

struct ConfigurableModifier:ViewModifier {
    init(withModifier modifier:Modifier) {
        self.modifier = modifier
    }
    
    func body(content: Content) -> some View {
//        switch modifier {
//        case .background(let color):
//            return content.background(color)
//        case .font(let size):
//            return content.font(Font.system(size: size))
//        case .null:
//            return content
//        }
        return Text("...")
    }
    
    private var modifier:Modifier
    
//    private func applyModifier(_ modifier:Modifier, toContent:Content) -> ViewModifier {
//        
//    }
}

struct CustomModifier:ViewModifier {
    
    var background:Color = Color.red
    var fontSize:CGFloat = 40
    var modifiers:[Modifier] = []
    
    init() {
        modifiers.append(.background(color:Color.red))
        modifiers.append(.font(size: 40))
    }
    
    func body(content: Content) -> some View {
        applyModifiers(modifiers, toContent: content)
    }
        
    private func applyModifiers(_ modifiers:[Modifier], toContent content:Content) -> some View {
        guard let modifier = modifiers.first else {
            return content.modifier(configurableModifier(.null))
        }
        if modifiers.count > 1 {
            let newModifiers = Array(modifiers[1..<modifiers.count])
            return applyModifiers(newModifiers, toContent: content)
        }
        return content.modifier(configurableModifier(modifier))
    }
    
    private func configurableModifier(_ modifier:Modifier) -> ConfigurableModifier {
        ConfigurableModifier(withModifier: modifier)
    }
}
