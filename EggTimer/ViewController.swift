//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var eggTime: [String: Int] = ["Soft":300, "Medium":420, "Hard":720]
    var timer = Timer()
    
    @IBAction func eggButton(_ sender: UIButton) {
        progressBar.progress = 0.0
        titleLabel.text = "Egg is cooking..."
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        var secondsRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if secondsRemaining > 0 {
                print("\(secondsRemaining) seconds left")
                secondsRemaining -= 1
                
                print(progressBar.progress)
                progressBar.progress += 1.0 / Float(eggTime[hardness]!)
            } else {
                Timer.invalidate()
                self.titleLabel.text = "Done!"
            }
        }
    }
}
