//
//  MoviesListResults.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

struct MoviesList: Decodable {
    var page: Int
    var results: [MovieItem]
    var total_pages: Int
    var total_results: Int
}
