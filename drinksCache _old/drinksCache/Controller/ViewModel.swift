//
//  ViewModel.swift
//  drinksCache
//
//  Created by Limei  Chen on 10/26/21.
//

import Foundation
class ViewModel {
    var drinks: DrinkModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    var updateUI: (() -> Void)?
    var networkService = NetworkService()
    
    init() {
        networkService.downloadData { drinks in
            self.drinks = drinks
        }
    }
    
    func bind(closure: @escaping () -> Void) {
        updateUI = closure
    }
    
//    var numRows: Int {
////        drinks.count ?? 0
//    }
    
    func getModel(row: Int) -> DrinkItem? {
        drinks?.drinks[row]
    }
}
