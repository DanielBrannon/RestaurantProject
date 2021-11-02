//
//  ViewController.swift
//  drinksCache
//
//  Created by Luat on 8/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    let filterStr = [
    "Ingredients", "Alcoholic", "Category", "Glass Type"]
    
    let ingredientsStr = ["Light rum", "Applejack", "Gin", "Dark rum"]
    let alcoholicStr = ["Alcoholic", "Non_alcoholic", "Optional alcohol"]
    
    let categoryStr = ["Ordinary Drink", "Cocktail", "Milk Float  Shake", "Other_Unknown", "Cocoa, Shot", "Coffee_Tea", "Homemade Liqueur", "Punch_Party Drink", "Beer", "Soft Drink_Soda"]
    let glassTypeStr = ["Highball glass", "Cocktail glass", "Old-fashioned glass", "Whiskey Glass",]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func searchPressed(_ sender: Any) {
        let pickerIndex = pickerView.selectedRow(inComponent: 0)
        print("Picker selection:", filterStr[pickerIndex])
        fetch()
    }
    
    let drinkAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=cocktail"
    let baseAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php"
    
    
    var drinks: [DrinkItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
        configureTableView()
        fetchData()
       
        
    }
    
    func configurePickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    
    func createRequest() -> URLRequest {
        guard let url = URL(string: drinkAddress) else {
            fatalError ("url required")
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)

        let queryKey = getQueryKey()
        let queryItems = URLQueryItem(name: queryKey, value: searchBar.text)
//
        components?.queryItems = [queryItems]
        
        guard let finalURL = components?.url else{
            fatalError("URL optional is nil")
        }
        let request = URLRequest(url:finalURL)
        return request

    }
    
    func getQueryKey() -> String {
        let queryKey: String
        switch pickerView.selectedRow(inComponent: 0) {
        case 0:
            queryKey = "i"
        case 1:
            queryKey = "a"
        case 2:
            queryKey = "c"
        case 3:
            queryKey = "g"
        default:
            queryKey = "g"
        }
        return queryKey
    }
    
    func fetch() {
        var request = createRequest()
        request.httpMethod = "GET"
        request.httpBody = Data()

        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            print("request url", request.url!)
        }
        dataTask.resume()
    }

    func configureTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: DrinkCell.identifier, bundle: nil), forCellReuseIdentifier: DrinkCell.identifier)
    }
    
    func fetchData() {
        downloadData { model in
            self.drinks = model.drinks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func downloadData(completion: @escaping (DrinkModel) -> Void) {
//        print("download data func start")
        guard let url = URL(string: drinkAddress) else { return }
        URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else { return }
            if let decoded = try? JSONDecoder().decode(DrinkModel.self, from: data) {
                completion(decoded)
//                print("completion is called")
            }
        }.resume()
//        print("download data func ends")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier) as? DrinkCell else { fatalError() }
        
        let drinkItem = drinks[indexPath.row]
        cell.drinkName.text = drinkItem.name
        cell.drinkDesc.text = drinkItem.idDrink

        /// Check if cache has image, load from cache
        if let cachedImage = ImageCache.shared.read(imageStr: drinkItem.imageStr) {
            cell.drinkImageView.image = cachedImage
        /// If not, fetch image from API
        } else {
            /// 3. Start task for each cell
            let currentRunningTask = ImageCache.shared.startFetchRequest(imageStr: drinkItem.imageStr) { image in
                DispatchQueue.main.async {
                    cell.drinkImageView.image = image
                }
            }
            /// 4. Cancel that Task if
            /// - IF tasks is not done
            /// - IF cell is reused
            cell.onReuse = {
                /// cancel task here
                if let currentRunningTask = currentRunningTask {
                    ImageCache.shared.runningTasks[currentRunningTask]?.cancel()
                    ImageCache.shared.runningTasks.removeValue(forKey: currentRunningTask)
                }

            }
        }
        
        return cell
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filterStr.count
    }
}
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filterStr[row]
    }
}
