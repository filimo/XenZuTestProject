//
//  MovieItem.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

struct MovieItem: Decodable, Identifiable {
    let id: Int
    let originalTitle: String
    let releaseDate: Date
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        originalTitle = try values.decode(String.self, forKey: .originalTitle)
        
        let releaseDate = try values.decode(String.self, forKey: .releaseDate)
        self.releaseDate = DateFormatter.jsonDateFormater.date(from: releaseDate) ?? Date()
        
        posterPath = try values.decode(String.self, forKey: .posterPath)
    }
}
