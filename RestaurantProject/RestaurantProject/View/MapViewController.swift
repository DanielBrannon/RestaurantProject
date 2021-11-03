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
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var streetName: UILabel!
    @IBOutlet weak var address2: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var socialMedia: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
