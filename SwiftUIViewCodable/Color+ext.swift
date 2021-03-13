//
//  Color+ext.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 13/03/21.
//  Copyright © 2021 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

/// An extention to UIColor to create a UIColor from an hex string
/// Two types of strings are supported:
/// - 8 char string with RGB and alpha
/// - 6 char string with RGB only
/// The string can be prefixed with #
extension Color {
    /// Create a UIColor from a hex string
    /// The string can have # as a prefix and can be
    /// 6 or 8 chars long (8 chars for the alpha parameter)
    /// - Parameter hexString: The string containing the hex representation of the color
    public init?(hexString: String) {
        let r, g, b, a: Double

        let hexColor = hexString.replacingOccurrences(of: "#", with: "")
        
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = Double((hexNumber & 0xff000000) >> 24) / 255
                g = Double((hexNumber & 0x00ff0000) >> 16) / 255
                b = Double((hexNumber & 0x0000ff00) >> 8) / 255
                a = Double(hexNumber & 0x000000ff) / 255
                
                self.init(red: r, green: g, blue: b, opacity: a)
                return
            }
        }
        else if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = Double((hexNumber & 0xff0000) >> 16) / 255
                g = Double((hexNumber & 0x00ff00) >> 8) / 255
                b = Double(hexNumber & 0x0000ff) / 255
                a = 1
                
                self.init(red: r, green: g, blue: b, opacity: a)
                return
            }
        }

        return nil
    }
}
