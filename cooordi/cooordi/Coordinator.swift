//
//  Coordinator.swift
//  cooordi
//
//  Created by Limei  Chen on 10/21/21.
//

import UIKit

class Coordinator {
    let navigationController: UINavigationController
    
    init(_ rootController: UIViewController) {
        self.navigationController = UINavigationController(rootViewController: rootController)
        
    }
}

extension Coordinator: ViewControllerDelegate {
    func go() {
        let vc = UIStoryboard(name: "SecondVC", bundle: .main).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}

extension Coordinator: SecondViewControllerDelegate {
    func goToThird() {
        print("gotoThird called")
        let viewC = UIStoryboard(name: "ThirdVC", bundle: .main).instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
        navigationController.pushViewController(viewC, animated: true)
    }
    
}


