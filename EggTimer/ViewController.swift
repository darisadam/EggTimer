//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var eggTime: [String: Int] = ["Soft":300, "Medium":420, "Hard":720]
    
    @IBAction func eggButton(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        var secondsRemaining = eggTime[hardness]!
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                print("\(secondsRemaining) seconds left")
                secondsRemaining -= 1
            } else {
                Timer.invalidate()
            }
        }
    }
    
}
