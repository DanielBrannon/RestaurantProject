//
//  ViewModel.swift
//  MovieBrowser
//
//  Created by Limei  Chen on 10/28/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation


class MovieViewModel {
    var movies: MovieModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    
    var updateUI: (() -> Void)?
    var network = Network()
    
    func fetchSearchedMovie (input: String) {
        
        network.searchMovies(searchBarText: input) { movies in
            self.movies = movies
        }
    }
    
    func bind(closure: @escaping () -> Void) {
        updateUI = closure
    }
    
    var numRows: Int {
        movies?.results.count ?? 0
    }
    
    func getModel(row: Int) -> Movie? {
        movies?.results[row]
    }
    
    func getImage () {
        
    }
    
}

