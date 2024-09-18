//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer?
    var eggTime: [String: Int] = ["Soft":5, "Medium":420, "Hard":720]
    var timer = Timer()
    
    @IBAction func eggButton(_ sender: UIButton) {
        progressBar.progress = 0.0
        titleLabel.text = sender.currentTitle
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        var secondsRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if secondsRemaining > 0 {
                
                secondsRemaining -= 1
                print("\(secondsRemaining) seconds left")
                
                progressBar.progress += 1.0 / Float(eggTime[hardness]!)
                print(progressBar.progress)
            } else {
                Timer.invalidate()
                self.titleLabel.text = "Done!"
                playSound()
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
