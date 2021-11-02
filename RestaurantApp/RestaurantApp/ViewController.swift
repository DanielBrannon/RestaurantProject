//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Limei  Chen on 11/2/21.
//


import UIKit



protocol ViewControllerDelegate {
    func goToMapVC()
}
class ViewController: UIViewController {

//    var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: ViewControllerDelegate!

    var viewModel = RestaurantViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVM()
        setupCollectionView()
        
            
        }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
        
    }

    func setupVM() {
        viewModel.bind {
            
            self.collectionView.reloadData()
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("this is the  row count", viewModel.numRows)
        
        return viewModel.numRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(model: viewModel.getModel(row: indexPath.row))
        cell.backgroundColor = .red
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/2
        return CGSize(width: width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
