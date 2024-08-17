import UIKit
import AVFoundation

class PawCusViewController: UIViewController {

    // IBOutlet for the progress bar and cake button
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var cakeButton: UIButton!

    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initial setup for the progress bar
        updateProgressBarColor()
    }

    // Function to update the progress bar color based on its value
    func updateProgressBarColor() {
        let progress = progressBar.progress

        if progress < 0.5 {
            progressBar.progressTintColor = .red
        } else if progress == 0.5 {
            progressBar.progressTintColor = .yellow
        } else {
            progressBar.progressTintColor = .green
        }
    }

    // IBAction for the cake button
    @IBAction func cakeButtonTapped(_ sender: UIButton) {
        // Increase the progress by 0.1
        progressBar.progress += 0.1

        // Ensure the progress bar doesn't exceed 1.0
        if progressBar.progress > 1.0 {
            progressBar.progress = 1.0
        }

        // Update the progress bar color after increasing the progress
        updateProgressBarColor()

        // Play the sound
        playSound()
    }

    // Function to play sound
    func playSound() {
        guard let url = Bundle.main.url(forResource: "yippee", withExtension: "mp3") else { return }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
