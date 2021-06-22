//
//  EndpointKind.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

protocol EndpointKind {
    associatedtype RequestData
    
    static func prepare(_ request: inout URLRequest,
                        with data: RequestData)
    static func prepare(_ components: inout URLComponents,
                        with data: RequestData)
}
