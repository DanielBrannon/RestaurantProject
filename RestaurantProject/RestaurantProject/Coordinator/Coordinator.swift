//
//  Coordinator.swift
//  RestaurantProject
//
//  Created by Daniel Brannon on 11/2/21.
//

import UIKit

class Coordinator {
    var navCon = UINavigationController()
    
    func pushRestaurantVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let restaurantVC = sb.instantiateViewController(identifier: "MainViewController") as? MainViewController {
            restaurantVC.delegate = self
            navCon.pushViewController(restaurantVC, animated: true)
        }
    }
}
extension Coordinator: MainViewControllerDelegate {
    
    func goToMapVC() {
        let vc = UIStoryboard(name: "Map", bundle: nil).instantiateViewController(identifier: "MapVC") as! MapVC
    
        navCon.pushViewController(vc, animated: true)
            }
    
}
