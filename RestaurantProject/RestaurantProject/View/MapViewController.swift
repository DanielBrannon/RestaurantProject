//
//  MapViewController.swift
//  RestaurantProject
//
//  Created by Daniel Brannon on 11/2/21.
//

import Foundation
import UIKit
import MapKit

class MapVC: UIViewController, UIPageViewControllerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var streetName: UILabel!
    @IBOutlet weak var address2: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var socialMedia: UILabel!
    
    var restaurantDetails: Restaurants?
    var myUrl: String?
    var myStorageVariable: String = ""
    var myAddressVariable: String = ""
    var centerPoint = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let longitude = restaurantDetails?.location?.lng {
            if let latitude = restaurantDetails?.location?.lat {
                centerPoint.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                mapView.addAnnotation(centerPoint)
                
            }
        }
        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: restaurantDetails!.location!.lat, longitude: restaurantDetails!.location!.lng)
        mapView.region.span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        centerPoint.title = restaurantDetails?.name
        restaurantName.text = restaurantDetails?.name
        restaurantType.text = restaurantDetails?.category
        streetName.text = restaurantDetails?.location?.address
        if let city = restaurantDetails?.location?.city {
            myAddressVariable += city
        }
        if let state = restaurantDetails?.location?.state {
            myAddressVariable +=  ", " + state
        }
        if let zipCode = restaurantDetails?.location?.postalCode {
            myAddressVariable += " "  + zipCode
        }
        address2.text = myAddressVariable
        phone.text = restaurantDetails?.contact?.formattedPhone
        if let facebook = restaurantDetails?.contact?.facebook {
            if myStorageVariable == "" {
            myStorageVariable += facebook
            } else {
            myStorageVariable += myStorageVariable + "\n @" + facebook
            }
        }
        if let fbookName = restaurantDetails?.contact?.facebookName {
            if myStorageVariable == "" {
                myStorageVariable += fbookName
            } else {
                myStorageVariable += myStorageVariable + "\n @" + fbookName
            }
        }
        if let fbookUsername = restaurantDetails?.contact?.facebookUsername {
            if myStorageVariable == "" {
                myStorageVariable += fbookUsername
            } else {
                myStorageVariable += myStorageVariable + "\n @" + fbookUsername
            }
        }
        if let twitter = restaurantDetails?.contact?.twitter {
            if myStorageVariable == "" {
                myStorageVariable += twitter
            } else {
                myStorageVariable += myStorageVariable + "\n @" + twitter
            }
        }
        if myStorageVariable == "" {
            socialMedia.text = ""
        } else {
            socialMedia.text = "@" + myStorageVariable
        }
    }
    
}
