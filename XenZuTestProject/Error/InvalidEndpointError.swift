//
//  InvalidEndpointError.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

struct InvalidEndpointError<K: EndpointKind, R: Decodable>: Error {
    init(endpoint: Endpoint<K, R>) {}
}
