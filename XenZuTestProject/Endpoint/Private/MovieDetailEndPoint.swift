//
//  MovieDetail.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation


// https://api.themoviedb.org/3/movie/337404?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3

extension Endpoint where Kind == EndpointKinds.Private,
                         Response == MovieDetail {
    static func movieDetail(withID id: MovieDetail.ID) -> Self {
        Endpoint(path: "movie/\(id)")
    }
}
