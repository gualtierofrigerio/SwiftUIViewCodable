//
//  Modifier.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 02/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

/// Enum describing a view modifier
/// Currently I only support background with a color and font for Text
enum Modifier {
    case background(color:Color)
    case font(size:CGFloat)
    case null
}

/// Modifier conforms to Decodable
/// so we can get a modifier from a piece of JSON
extension Modifier: Decodable {
    init(from decoder:Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let object = try? container.decode([String:String].self) {
            self = Modifier.decodeFromObject(object)
        }
        else {
            self = .null
        }
    }
    
    static func decodeFromObject(_ object:[String:String]) -> Modifier {
        guard let typeString = object["type"] else { return .null }
        var modifier:Modifier = .null
        switch typeString {
        case "background":
            if  let colorString = object["color"],
                let color = Color(hexString: colorString) {
                modifier = .background(color: color)
            }
        case "font":
            if let sizeStr = object["size"],
               let size = NumberFormatter().number(from: sizeStr) {
                modifier = .font(size: CGFloat(truncating: size))
            }
        default:
            modifier = .null
        }
        return modifier
    }
}
