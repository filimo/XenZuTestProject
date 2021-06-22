//
//  MoviesList.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

// https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3&page=1

extension Endpoint where Kind == EndpointKinds.Private,
    Response == MoviesList
{
    static func moviesList(page: Int) -> Self {
        Endpoint(
            path: "discover/movie",
            queryItems: [.init(name: "page", value: String(page))]
        )
    }
}
