//
//  CollectionViewCell.swift
//  RestaurantApp
//
//  Created by Limei  Chen on 11/2/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
//    static let identifier = String(describing: CollectionViewCell.self)
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configure(model: Restaurants?) {
        guard let model = model else{
            print("error")
            return
        }
        print("model", model)
        nameLabel.text = model.name
        categoryLabel.text = model.category
    }
}
