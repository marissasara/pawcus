//
//  StoreCollectionViewController.swift
//  PawCus
//
//  Created by STDC_32 on 09/08/2024.
//

import UIKit

class StoreCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var data1: [Cats] = []
    var data2: [Foods] = []
    var data3: [Decorations] = []  // New dataset
    var currentData: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        data1 = Cats.sampleTeamData()
        data2 = Foods.sampleFoodData()
        data3 = Decorations.sampleDecoData() // Load new data
        
        currentData = data1  // Default to the first dataset
        
        // Set up the segmented control target action
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
        
       
    }
    
    @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentData = data1
        case 1:
            currentData = data2
        case 2:
            currentData = data3
        default:
            break
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoreCollectionViewCell
        
        if let catItem = currentData[indexPath.row] as? Cats {
            itemCell.catsImage.image = catItem.photo
            itemCell.catsName.text = catItem.name
        } else if let foodItem = currentData[indexPath.row] as? Foods {
            itemCell.catsImage.image = foodItem.photo // Assuming Foods has a photo property
            itemCell.catsName.text = foodItem.name // Assuming Foods has a name property
        } else if let decorationItem = currentData[indexPath.row] as? Decorations {
            itemCell.catsImage.image = decorationItem.photo // Assuming Decorations has a photo property
            itemCell.catsName.text = decorationItem.name // Assuming Decorations has a name property
        }
        
        return itemCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? DetailViewController,
               let indexPath = collectionView.indexPath(for: sender as! UICollectionViewCell) {
                let selectedItem = currentData[indexPath.row]
                detailVC.item = selectedItem
            }
        }
    }

}

extension StoreCollectionViewController: StoreCollectionViewCellDelegate {
    func didTapDetailButton(on cell: StoreCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let selectedItem = currentData[indexPath.row]
        
        performSegue(withIdentifier: "showDetail", sender: selectedItem)
    }
}
