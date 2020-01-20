//
//  RunningViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-16.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk

class RunningViewController: UIViewController {
    
    var savedData_global: [RunModel] = []
    var longestRun = 0.0
    let selection = UIImpactFeedbackGenerator()
    

    @IBOutlet weak var longestRunLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        savedData_global = loadSavedData()
        displayData(savedData: savedData_global)
    }
    
    
    @IBAction func returnToWorkouts(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: false)
        selection.impactOccurred(intensity: 0.5)
    }
    
    func displayData(savedData: [RunModel]) {
        
        for run in savedData {
            
            if let runDistance = Double(run.runDistance) {
                
                if runDistance > longestRun {
                    longestRun = runDistance
                }
            }
        }
        print(longestRun)
        let longestRunString = String(format: "%.1f", longestRun)
        print(longestRunString)
        longestRunLabel.text = "\(longestRunString)Km"
        
    }
    
    func loadSavedData()-> [RunModel] {
        //Makes an empty [PushModel]
        var savedData = [RunModel]()
        print("loadSavedData")
        
        //This do catch block tries to retreived any saved data
        do {
            savedData = try Disk.retrieve("Folder/savedRuns.json", from: .caches, as: [RunModel].self)
            
        } catch {
            print("No data found")
            longestRunLabel.text = "0.0Km"
            //Give the user some feedback regrading this event
        }
        
        //Returns the data
        return savedData
    }
    
    
    
}
