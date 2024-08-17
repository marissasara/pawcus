//
//  ViewController.swift
//  PawCus
//
//  Created by STDC_32 on 06/08/2024.
//

import UIKit
import AVFoundation

class Music {
    let thumbnail: UIImage
    let title: String
    let audioFileName: String // Local file name or URL for streaming

    init(thumbnail: UIImage, title: String, audioFileName: String) {
        self.thumbnail = thumbnail
        self.title = title
        self.audioFileName = audioFileName
    }
}

class MusicViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var roundedCornerImage: UIImageView!
    
    var musics: [Music] = []
    var currentMusicIndex = 0
    var isPlaying = false
    var audioPlayer: AVAudioPlayer?
    var progressUpdateTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMusics()
        displayMusics(at: currentMusicIndex)
        configureButtonIcons()
        
        roundedCornerImage.layer.cornerRadius = 20
    }
    
    func loadMusics() {
        musics = [
            Music(thumbnail: UIImage(named: "music1")!, title: "Ocean Water Noise", audioFileName: "Nature Water Noise.mp3"),
            Music(thumbnail: UIImage(named: "music2")!, title: "Nature Bird Chirping", audioFileName: "Bird Chirping.mp3"),
            Music(thumbnail: UIImage(named: "music3")!, title: "Beach Wave Sound", audioFileName: "Beach Wave.mp3")
        ]
    }
    
    func displayMusics(at index: Int) {
        guard index >= 0 && index < musics.count else { return }
        
        let music = musics[index]
        thumbnailImageView.image = music.thumbnail
        titleLabel.text = music.title
        
        progressBar.setProgress(0, animated: false) // Reset progress bar
        prepareToPlayMusic(named: music.audioFileName)
    }
    
    func prepareToPlayMusic(named fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: nil) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error preparing music: \(error)")
            }
        } else {
            print("Audio file not found: \(fileName)")
        }
    }
    
    func playMusic() {
        if let player = audioPlayer {
            player.play()
            isPlaying = true
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            // Start progress bar timer
            progressUpdateTimer?.invalidate()
            progressUpdateTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                guard let self = self, let player = self.audioPlayer else { return }
                self.updateProgressBar(currentTime: player.currentTime, duration: player.duration)
            }
        }
    }
    
    func configureButtonIcons() {
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        nextButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        previousButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if isPlaying {
            audioPlayer?.pause()
            isPlaying = false
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            playMusic()
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentMusicIndex = (currentMusicIndex + 1) % musics.count
        displayMusics(at: currentMusicIndex)
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        currentMusicIndex = (currentMusicIndex - 1 + musics.count) % musics.count
        displayMusics(at: currentMusicIndex)
    }
    
    @IBAction func podcastButtonTapped(_ sender: UIButton) {
        // Update the index based on the button's tag
        currentMusicIndex = sender.tag
        displayMusics(at: currentMusicIndex)
    }
    
    func updateProgressBar(currentTime: TimeInterval, duration: TimeInterval) {
        let progress = Float(currentTime / duration)
        progressBar.setProgress(progress, animated: true)
    }
    
    deinit {
        progressUpdateTimer?.invalidate()
    }
}



