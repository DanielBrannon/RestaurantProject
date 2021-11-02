//
//  MainViewController.swift
//  GroupProject
//
//  Created by Daniel Brannon on 11/2/21.
//
import UIKit

class MainViewController: UIViewController {
    let collectionView = UICollectionView()
    var myData: [Restaurants] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingRequest().fetch() { response in
            DispatchQueue.main.async {
                self.myData = response.restaurants
                self.collectionView.reloadData()
                self.title = "Lunch Tyme"
                let nib = UINib(nibName: "myCell", bundle: nil)
                self.collectionView.register(nib, forCellWithReuseIdentifier: "myCell")
            }
       
    }
        func setupCollectionView() {
               
    }
}
}
extension MainViewController: UICollectionViewDelegate {
    
}
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
extension MainViewController: UICollectionViewDelegateFlowLayout {}
