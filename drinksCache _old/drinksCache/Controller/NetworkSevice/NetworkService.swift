//
//  NetworkService.swift
//  drinksCache
//
//  Created by Limei  Chen on 10/26/21.
//

import Foundation

struct NetworkService {
    let drinkAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=cocktail"
    
    func downloadData(completion: @escaping (DrinkModel) -> Void) {
        print("download data func start")
        guard let url = URL(string: drinkAddress) else { return }
        URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else { return }
            if let decoded = try? JSONDecoder().decode(DrinkModel.self, from: data) {
                completion(decoded)
                print("completion is called")
            }
        }.resume()
        print("download data func ends")
    }
    
    
}
