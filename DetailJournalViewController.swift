//
//  DetailViewController.swift
//  PawCus
//
//  Created by STDC_27 on 09/08/2024.
//

import UIKit

class DetailJournalViewController: UIViewController {

    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!

    var selectedJournalHistory: JournalHistory?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = selectedJournalHistory?.photo
        dateLabel.text = selectedJournalHistory?.date
        contentLabel.text = selectedJournalHistory?.content

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
