//
//  StoreCollectionViewCell.swift
//  PawCus
//
//  Created by STDC_32 on 09/08/2024.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var catsImage: UIImageView!
    @IBOutlet var catsName: UILabel!
    @IBOutlet var detailButton: UIButton!
       
       weak var delegate: StoreCollectionViewCellDelegate?
       
       @IBAction func detailButtonTapped(_ sender: UIButton) {
           delegate?.didTapDetailButton(on: self)
       }

}
protocol StoreCollectionViewCellDelegate: AnyObject {
    func didTapDetailButton(on cell: StoreCollectionViewCell)
}
