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
    var delegate: MainViewControllerDelegate? = Coordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingRequest().fetch() { response in
            DispatchQueue.main.async {
                self.myData = response.restaurants
                self.collectionView.reloadData()
                
                self.title = "Lunch Tyme"
                
                setupCollectionView()
            }
    }
        func setupCollectionView() {
            collectionView.delegate = self
            collectionView.dataSource = self
            let nib = UINib(nibName: "myCell", bundle: nil)
            self.collectionView.register(nib, forCellWithReuseIdentifier: "myCell")
    }
        
}
    
}
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let navController = UINavigationController()
        let vc = UIStoryboard(name:"MapVC", bundle: nil).instantiateViewController(withIdentifier: "MapViewController")  as! MapViewController
        navController.pushViewController(vc, animated: true)
           
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
        var restaurantItem = myData[indexPath.row]
               restaurantItem.backgroundImageURL = "https" + restaurantItem.backgroundImageURL.dropFirst(4)
        cell.nameLabel.text = myData[indexPath.row].name
        cell.typeLabel.text = myData[indexPath.row].category
        if let cachedImage = ImageCache.shared.read(imageStr: restaurantItem.backgroundImageURL) {
            cell.imageView.image = cachedImage
        } else {
            let currentRunningTask = ImageCache.shared.startFetchRequest(imageStr: restaurantItem.backgroundImageURL) { image in
                DispatchQueue.main.async {
                    cell.imageView.image = image
                }
            }
            cell.onReuse = {
                if let currentRunningTask = currentRunningTask {
                    ImageCache.shared.runningTasks[currentRunningTask]?.cancel()
                    ImageCache.shared.runningTasks.removeValue(forKey: currentRunningTask)
                }
            }
        }
        cell.backgroundColor = .systemBlue
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
