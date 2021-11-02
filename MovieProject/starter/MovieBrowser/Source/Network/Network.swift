//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

//class Network {
//    let apiKey = "5885c445eab51c7004916b9c0313e2d3"
//
//}
class Network {
    let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    let baseURL = "https://api.themoviedb.org/3/search/movie?api_key=5885c445eab51c7004916b9c0313e2d3&ery="
    let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=5885c445eab51c7004916b9c0313e2d3&query=The+Godfather")
    
    
    
//    fetching list of movies
    func searchMovies( searchBarText: String, completion: @escaping (MovieModel) -> Void) {
       let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=5885c445eab51c7004916b9c0313e2d3&query=" + searchBarText)
        if let url = url {
            URLSession.shared.dataTask(with: url ) { data, r, e in
                guard let data = data else { return }
                do {
                    let decoded = try JSONDecoder().decode(MovieModel.self, from: data)
                    completion(decoded)
                    print("this is the decoded data", decoded)
                } catch {
                    print("error")
                }
            }.resume()
        }
    }
}

