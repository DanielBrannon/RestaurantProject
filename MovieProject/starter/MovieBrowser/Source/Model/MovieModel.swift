//
//  Model.swift
//  MovieBrowser
//
//  Created by Limei  Chen on 10/28/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation


struct MovieModel: Decodable {
    let results: [Movie]
}
struct Movie: Decodable {
    let overview: String
    let title: String
    let posterPath: String?
    let voteAverage: Double
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case overview
        case title
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
    
}
