//
//  JSONDecoder.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 04/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation

/// Helper class to decode a ViewNode from Data
class JSONHelper {
    /// Get a ViewNode from Data
    /// - Parameter data: Data containing a JSON representing a ViewNode
    /// - Returns: An optional ViewNode if it was possible to decode one from Data
    class func node(fromData data:Data) -> ViewNode? {
        let decoder = JSONDecoder()
        do {
            let node = try decoder.decode(ViewNode.self, from: data)
            return node
        }
        catch (let error) {
            print(error)
        }
        
        return nil
    }
}
