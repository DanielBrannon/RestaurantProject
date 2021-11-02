//
//  Coordinator.swift
//  MovieBrowser
//
//  Created by Limei  Chen on 10/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation


import UIKit

class Coordinator {
    var navCon = UINavigationController()
    func pushSearchVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let searchVC = sb.instantiateViewController(identifier: "SearchVC") as? SearchViewController {
            searchVC.delegate = self
            navCon.pushViewController(searchVC, animated: true)
        }
    }
}
extension Coordinator: SearchViewControllerDelegate {
    
    func goToDetail() {
        let vc = UIStoryboard(name: "DetailVC", bundle: nil).instantiateViewController(identifier: "DetailVC") as! MovieDetailViewController
        navCon.pushViewController(vc, animated: true)
    }
    
}







