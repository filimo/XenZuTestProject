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
    var totalPages: Int
    var totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
