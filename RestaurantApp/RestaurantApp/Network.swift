//
//  Network.swift
//  RestaurantApp
//
//  Created by Limei  Chen on 11/2/21.
//

import Foundation

struct Network {
    let url = URL(string: "https://s3.amazonaws.com/br-codingexams/restaurants.json")
    
    func fetchRestaurants(completion: @escaping (RestaurantModel) -> Void) {
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, r, e in
                guard let data = data else { return }
                do {
                    let decoded = try JSONDecoder().decode(RestaurantModel.self, from: data)
                    completion(decoded)
                    //print("this is decoded data", decoded)
                } catch {
                    print("error")
                }
            }.resume()
        }
    }
}
