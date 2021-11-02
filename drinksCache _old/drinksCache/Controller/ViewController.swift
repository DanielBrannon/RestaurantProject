//
//  ViewController.swift
//  drinksCache
//
//  Created by Luat on 8/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var drinks: [DrinkItem] = []
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupVM()
        
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: DrinkCell.identifier, bundle: nil), forCellReuseIdentifier: DrinkCell.identifier)
    }
    func setupVM() {
        viewModel.bind {
            self.tableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier) as? DrinkCell else { fatalError() }
        
        let drinkItem = drinks[indexPath.row]
        cell.drinkName.text = drinkItem.name
        cell.drinkDesc.text = drinkItem.idDrink
        
        /// Todo: Download image
        
        /// Check if cache has image, load from cache
        if let cachedImage = ImageCache.shared.read(imageStr: drinkItem.imageStr) {
            cell.drinkImageView.image = cachedImage
        /// If not, fetch image from API
        } else {
            if let url = URL(string: drinkItem.imageStr) {
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    guard let data = data else { return }
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.drinkImageView.image = image
                        }
                        ImageCache.shared.write(imageStr: drinkItem.imageStr, image: image)
                    }
                }.resume()
            }
        }
        
        return cell
    }
    
    

}
