//
//  Model.swift
//  RestaurantApp
//
//  Created by Limei  Chen on 11/2/21.
//

import Foundation

struct RestaurantModel: Decodable {
    let restaurants: [Restaurants]
}

struct Restaurants: Decodable {
    let name: String
    let backgroundImageURL: String
    let category: String
    let contact: Contact?
    let location: Location
}

struct Contact: Codable {
    let phone, formattedPhone: String
    let twitter, facebook, facebookUsername, facebookName: String?
}

struct Location: Decodable {
    let address: String
    let crossStreet: String?
    let lat, lng: Double
    let postalCode: String?
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
}
