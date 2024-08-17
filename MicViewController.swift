//
//  MicViewController.swift
//  PawCus
//
//  Created by STDC_27 on 09/08/2024.
//

import UIKit

class MicViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var soundWaveImageView: UIImageView!
    @IBOutlet weak var startRecordButton: UIButton!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initially hide the sound wave image
        soundWaveImageView.image = nil
    }
    
    // MARK: - IBAction for Start Record Button
    @IBAction func startRecording(_ sender: UIButton) {
        // Toggle display of the sound wave image
        if soundWaveImageView.image == nil {
            // Display the sound wave image when button is clicked
            soundWaveImageView.image = UIImage(named: "soundwave")
            startRecordButton.setTitle("Stop Record", for: .normal)
        } else {
            // Hide the sound wave image when button is clicked again
            soundWaveImageView.image = nil
            startRecordButton.setTitle("Start Record", for: .normal)
        }
    }
}
