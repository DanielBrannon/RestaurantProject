//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

protocol SearchViewControllerDelegate {
    func goToDetail()
}


class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate {
    
   
    var delegate: SearchViewControllerDelegate!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MovieViewModel()
    var network = Network()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVM()
        
        title = "Movie Search"
        view.backgroundColor = .blue
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        let myNib = UINib(nibName: "MyCustomCell", bundle: nil)
        tableView.register(myNib, forCellReuseIdentifier: "cell")
    }
    
    func setupVM() {                     
        viewModel.bind {
            self.tableView.reloadData()
        }
    }
    
   
    @IBAction func goPressed(_ sender: Any) {
        let searchText = searchBar.text!.replacingOccurrences(of: " ", with: "+")
        viewModel.fetchSearchedMovie(input:searchText)
        
    }
    
    
//    func createRequest() -> URLRequest {
//        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=5885c445eab51c7004916b9c0313e2d3&") else {
//            fatalError ("url required")
//        }
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
//
//        
//        let queryItems = [URLQueryItem(name: "api_key", value:"5885c445eab51c7004916b9c0313e2d3"),URLQueryItem(name: "query", value: searchBar.text?.replacingOccurrences(of: " ", with: "+"))]
//
//        components?.queryItems = queryItems
//        
//        guard let finalURL = components?.url else{
//            fatalError("URL optional is nil")
//        }
//        let request = URLRequest(url:finalURL)
//        print("this is the request", request)
//        return request
//    }
//    
//    func fetch() {
//        var request = createRequest()
//        request.httpMethod = "GET"
//        request.httpBody = Data()
//
//        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
//            let decodedData = String(decoding: data!, as: UTF8.self)
//            print("this is decodedData", decodedData)
//            
//            print("request url", request.url!)
//
//        }
//        dataTask.resume()
//    }
//    
//   

}
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("this is the row count", viewModel.numRows)
        return viewModel.numRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCell
        cell.configure(model: viewModel.getModel(row: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.goToDetail()
    }
}
