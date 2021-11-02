//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    
    var movies: Movie?
    
    var viewModel = MovieViewModel()
    var network = Network()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        
        titleLabel.text = "Title"
        dateLabel.text = "Date"
        overviewLabel.text = "Overview"
       
        func configure(model: Movie?) {
            guard let model = model else { return }
            
            titleLabel.text = "Title: \(model.title)"
            dateLabel.text = "Relase Date \(model.releaseDate)"
            overviewLabel.text = "Overview \(model.overview)"

        
        
    
    }
}

}
