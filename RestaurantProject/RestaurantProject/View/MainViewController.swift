//
//  MainViewController.swift
//  GroupProject
//
//  Created by Daniel Brannon on 11/2/21.
//
import UIKit

protocol MainViewControllerDelegate {
    func goToMapVC()
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var myData: [Restaurants] = []
    var viewModel = MainViewModel()
    var delegate: MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingRequest().fetch() { response in
            DispatchQueue.main.async {
                self.myData = response.restaurants
                self.collectionView.reloadData()
                
                self.title = "Lunch"
                setupCollectionView()
            }
    }
        func setupCollectionView() {
            collectionView.delegate = self
            collectionView.dataSource = self
//            collectionView.delegateFlowLayout = self
            let nib = UINib(nibName: "myCell", bundle: nil)
            self.collectionView.register(nib, forCellWithReuseIdentifier: "myCell")
    }
}
}
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let nestedData = data[indexPath.row].data
//            let redditUrl = nestedData.url
//            let _ = spinner
//            spinner.showIn(view)
//            print("This is the urlData:  \(redditUrl)")
            delegate?.goToMapVC()
        }



}
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? myCell else {
            fatalError("could not dequeue cell")
        }
        cell.nameLabel.text = myData[indexPath.row].name
        cell.typeLabel.text = myData[indexPath.row].category
        return cell
    }
}
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
