//
//  MapViewController.swift
//  RestaurantProject
//
//  Created by Daniel Brannon on 11/2/21.
//

import Foundation
import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }

}
