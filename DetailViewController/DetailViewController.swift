//
//  DetailViewController.swift
//  PawCus
//
//  Created by STDC_32 on 10/08/2024.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    // If needed for additional info

    var item: Any?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the UI with item data
        if let catItem = item as? Cats {
            imageView.image = catItem.photo
            nameLabel.text = catItem.name
        } else if let foodItem = item as? Foods {
            imageView.image = foodItem.photo
            nameLabel.text = foodItem.name
        } else if let decorationItem = item as? Decorations {
            imageView.image = decorationItem.photo
            nameLabel.text = decorationItem.name
        }
    }
}

