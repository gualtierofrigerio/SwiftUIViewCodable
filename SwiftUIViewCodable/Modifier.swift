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

extension Modifier {
    init() {
        self = .null
    }
    
    init(withType type:String, parameters:[String:Any]) {
        self = .null
        switch type {
        case "background":
            if  let colorString = parameters["color"] as? String,
                let color = Modifier.colorFromString(colorString) {
                self = .background(color: color)
            }
        case "font":
            if let size = parameters["size"] as? CGFloat {
                self = .font(size: size)
            }
        default:
            self = .null
        }
    }
    
    static func colorFromString(_ string:String) -> Color? {
        return Color.yellow
    }
}

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
                let color = Modifier.colorFromString(colorString) {
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
