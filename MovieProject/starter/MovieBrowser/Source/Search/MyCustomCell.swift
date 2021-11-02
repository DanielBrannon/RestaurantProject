//
//  MyCustomCell.swift
//  MovieBrowser
//
//  Created by Limei  Chen on 10/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    func configure(model: Movie?) {
        guard let model = model else { return }
        
        titleLabel.text = "Title: \(model.title)"
        dateLabel.text = "Relase Date \(model.releaseDate)"
        voteLabel.text = String(model.voteAverage)
        
        
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
