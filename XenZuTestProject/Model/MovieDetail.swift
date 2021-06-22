//
//  MovieDetailResult.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

struct MovieDetail: Decodable {
    typealias ID = Int
    
    let id: ID
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        originalTitle = try values.decode(String.self, forKey: .originalTitle)
        overview = try values.decode(String.self, forKey: .overview)

        let releaseDate = try? values.decode(String.self, forKey: .releaseDate)
        self.releaseDate = DateFormatter.jsonDateFormater.date(from: releaseDate ?? "") ?? Date()
        
        posterPath = try values.decode(String.self, forKey: .posterPath)
    }
}
