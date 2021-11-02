//
//  Coordinator.swift
//  RestaurantApp
//
//  Created by Limei  Chen on 11/2/21.
//

import UIKit

class Coordinator {
    var navCon = UINavigationController()
    func pushRestaurantVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let restaurantVC = sb.instantiateViewController(identifier: "restaurantVC") as? ViewController {
            restaurantVC.delegate = self
            navCon.pushViewController(restaurantVC, animated: true)
        }
    }
}
extension Coordinator: ViewControllerDelegate {
    
    func goToMapVC() {
        let vc = UIStoryboard(name: "MapVC", bundle: nil).instantiateViewController(identifier: "MapVC") as! MapViewController
        navCon.pushViewController(vc, animated: true)
            }
    
}
