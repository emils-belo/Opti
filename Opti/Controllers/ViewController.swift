//
//  ViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-13.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk

class ViewController: UIViewController {
    
    let selection = UIImpactFeedbackGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    //MARK: - Haptic Feedback
    
    //Haptic Feedback for Workouts
    /*Gives the user haptic feedback on the way "down" and "up"*/
    @IBAction func workoutPressed(_ sender: UIButton) {
        selection.impactOccurred(intensity: 0.7)
    }
    
    @IBAction func workoutPressedUp(_ sender: UIButton) {
        selection.impactOccurred(intensity: 1.0)
    }
    
    //Haptic Feedback for any other buttons
    /*Gives the user haptic feedback when selected*/
    @IBAction func otherPressed(_ sender: Any) {
        selection.impactOccurred(intensity: 0.5)
    }
    
    
}

