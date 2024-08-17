//
//  HistoryTableViewCell.swift
//  PawCus
//
//  Created by STDC_27 on 08/08/2024.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {


    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var recordLabel: UILabel!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)
    }
}


