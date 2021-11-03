//
//  myCell.swift
//  RestaurantProject
//
//  Created by Daniel Brannon on 11/2/21.
//

import UIKit

class myCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var onReuse: () -> Void = {}

             override func prepareForReuse() {
                 super.prepareForReuse()
                 onReuse()
                 imageView.image = nil
             }
    
}
