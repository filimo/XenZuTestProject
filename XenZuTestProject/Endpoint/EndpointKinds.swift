//
//  EndpointKinds.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

enum EndpointKinds {
    enum Public: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with _: Void) {
            request.cachePolicy = .reloadIgnoringLocalCacheData
        }
        static func prepare(_ components: inout URLComponents,
                            with _: Void) {
        }
    }

    enum Private: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with token: AccessToken) {
            request.addValue("Bearer \(token.rawValue)",
                forHTTPHeaderField: "Authorization"
            )
        }
        
        static func prepare(_ components: inout URLComponents,
                            with token: AccessToken) {
            if components.queryItems == nil { components.queryItems = [] }
            
            components.queryItems?.append(URLQueryItem(name: "api_key", value: token.rawValue))
        }
    }
}
