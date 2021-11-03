//
//  NetworkingRequest.swift
//  GroupProject
//
//  Created by Daniel Brannon on 11/2/21.
//
import Foundation

protocol NetworkingRequestDelegate {
    func done(_ text: String)
}

struct NetworkingRequest:Decodable {
    var url = URL(string: "https://s3.amazonaws.com/br-codingexams/restaurants.json")
    
    func fetch(completion: @escaping (RestaurantModel) -> Void) {
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, r, e in
                guard let data = data else { return }
                do {
                    let decoded = try JSONDecoder().decode(RestaurantModel.self, from: data)
                    completion(decoded)
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
}
