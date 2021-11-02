//
//  RestaurantModel.swift
//  GroupProject
//
//  Created by Daniel Brannon on 11/2/21.
//
import Foundation

struct RestaurantModel: Codable {
    var restaurants: [Restaurants]
}
struct Restaurants: Codable {
    var name: String
    var backgroundImageURL: String
    var category: String
    var contact: ContactObject?
    var location: LocationObject?
}
struct ContactObject: Codable {
    var phone, formattedPhone: String
    var twitter, facebook, facebookUsername, facebookName: String?
}
struct LocationObject: Codable {
    var address: String
    var crossStreet: String?
    var lat: Double
    var lng: Double
    var postalCode: String?
    var cc: String
    var city: String
    var state: String
    var country: String
    var formattedAddress: [String]
}
