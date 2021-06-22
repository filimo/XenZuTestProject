//
//  Endpoint.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

struct Endpoint<Kind: EndpointKind, Response: Decodable> {
    var path: String
    var queryItems = [URLQueryItem]()
}

extension Endpoint {
    func makeRequest(with data: Kind.RequestData) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/discover/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        Kind.prepare(&components, with: data)
        
        print(components.debugDescription)

        guard let url = components.url else {
            return nil
        }

        var request = URLRequest(url: url)
        Kind.prepare(&request, with: data)
        return request
    }
}
