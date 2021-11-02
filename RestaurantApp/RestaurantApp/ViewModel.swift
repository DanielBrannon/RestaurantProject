//
//  ViewModel.swift
//  RestaurantApp
//
//  Created by Limei  Chen on 11/2/21.
//

import Foundation


class RestaurantViewModel {
    var restaurants: RestaurantModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    
    var updateUI: (() -> Void)?
    var network = Network()
    
    init() {
        network.fetchRestaurants { restaurants in
            self.restaurants = restaurants
        }
    }
    
    func bind(closure: @escaping () -> Void) {
        updateUI = closure
    }
    
    var numRows: Int {
        restaurants?.restaurants.count ?? 0
    }
    
    func getModel(row: Int) -> Restaurants? {
        restaurants?.restaurants[row]
    }
}
