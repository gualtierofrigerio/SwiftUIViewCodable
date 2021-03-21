//
//  CustomModifier.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 04/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

/// Struct used to apply custom modifiers to SwiftUI views
/// Eech modifier is described by the enum Modifier
struct CustomModifier:ViewModifier {
    var modifiers:[Modifier] = []
    
    init(withModifiers:[Modifier]) {
       modifiers = withModifiers
    }
    
    func body(content: Content) -> some View {
        applyModifiers(modifiers, toContent: content)
    }
    
    // MARK: - Private
    
    /// Apply a Modifier to a view
    /// - Parameters:
    ///   - modifier: A view modifier described by the Modifier enum
    ///   - content: The view to apply the modifier to
    /// - Returns: The modified view
    private func applyModifier(_ modifier:Modifier, toContent content:Content) -> some View {
        @ViewBuilder var modifiedView: some View {
            switch modifier {
            case .background(let color):
                content.background(color)
            case .font(let size):
                content.font(Font.system(size: size))
            case .null:
                content
            }
        }
        return modifiedView
    }
    
    /// Apply an array of modifiers to a view
    /// - Parameters:
    ///   - modifiers: The list of modifiers to apply
    ///   - content: The view to apply the modifiers to
    /// - Returns: The modified view
    private func applyModifiers(_ modifiers:[Modifier], toContent content:Content) -> some View {
        guard let modifier = modifiers.first else {
            return applyModifier(.null, toContent: content)
        }
        if modifiers.count > 1 {
            let newModifiers = Array(modifiers[1..<modifiers.count])
            return applyModifiers(newModifiers, toContent: content)
        }
        return applyModifier(modifier, toContent: content)
    }
}
