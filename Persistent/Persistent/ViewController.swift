//
//  ViewController.swift
//  Persistent
//
//  Created by Limei  Chen on 10/18/21.
//

import UIKit


class ViewController: UIViewController {
    let tableView = UITableView()
    
     var responseData:Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
      
//        ViewModel.fetch { response in
//            self.responseData = response
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
////                print("this is the fetched data", self.responseData!.data.children.first)
//
//                let data: Data? = try? JSONEncoder().encode(self.responseData)
//                let string = String(data:data!, encoding: .utf8)
////                print("this is string", string)
//
//
//                guard let save = try? DiskStorage.save(withKey: "encodedData2", value: string!)
//                else{
//                        print("can't save file")
//                        return
//                    }
//                print("data saved to the fileURL encodedData")
                
                guard let read = try? DiskStorage.read(fromKey: "encodedData3")
                else{
                    
                    print("no file found")
                    ViewModel.fetch { response in
                        self.responseData = response
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            
                            let data: Data? = try? JSONEncoder().encode(self.responseData)
                            let string = String(data:data!, encoding: .utf8)
                            
                            
                            guard let save = try? DiskStorage.save(withKey: "encodedData2", value: string!)
                            else{
                                    print("can't save file")
                                    return
                                }
                            print("data saved to the fileURL encodedData")
                        }
                    }
                    
                    print("No data retrieved")
                    return
                    
                }
                return
                print("data retrieve: \(read)")
            }
        }
//    }
//
//}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (responseData != nil) {
        return responseData!.data.children.count

        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let nestedData = responseData?.data.children[indexPath.row].data
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "Title: \(nestedData?.title ?? " ")"

        return cell
    }
}

