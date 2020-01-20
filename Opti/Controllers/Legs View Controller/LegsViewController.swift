//
//  LegsViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-17.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk

class LegsViewController: UIViewController {
    
    let selection = UIImpactFeedbackGenerator()
    let dateReference = NSDate.timeIntervalSinceReferenceDate
    
    //MARK: - IBOutlets
    //Barbell Back Squat IBOutlets
    @IBOutlet weak var barbellBackSquat_reps1: UITextField!
    @IBOutlet weak var barbellBackSquat_lbs1: UITextField!
    
    
    @IBOutlet weak var barbellBackSquat_reps2: UITextField!
    @IBOutlet weak var barbellBackSquat_lbs2: UITextField!
    
    @IBOutlet weak var barbellBackSquat_reps3: UITextField!
    @IBOutlet weak var barbellBackSquat_lbs3: UITextField!
    
    //Barbell Front Squat IBOutlets
    @IBOutlet weak var barbellFrontSquat_reps1: UITextField!
    @IBOutlet weak var barbellFrontSquat_lbs1: UITextField!
    
    @IBOutlet weak var barbellFrontSquat_reps2: UITextField!
    @IBOutlet weak var barbellFrontSquat_lbs2: UITextField!
    
    @IBOutlet weak var barbellFrontSquat_reps3: UITextField!
    @IBOutlet weak var barbellFrontSquat_lbs3: UITextField!
    
    //Bulgarian Split Squat
    @IBOutlet weak var bulgarianSplitSquat_reps1: UITextField!
    @IBOutlet weak var bulgarianSplitSquat_lbs1: UITextField!
    
    @IBOutlet weak var bulgarianSplitSquat_reps2: UITextField!
    @IBOutlet weak var bulgarianSplitSquat_lbs2: UITextField!
    
    @IBOutlet weak var bulgarianSplitSquat_reps3: UITextField!
    @IBOutlet weak var bulgarianSplitSquat_lbs3: UITextField!
    
    //Standing Calf Raise
    @IBOutlet weak var standingCalfRaise_reps1: UITextField!
    @IBOutlet weak var standingCalfRaise_lbs1: UITextField!
    
    @IBOutlet weak var standingCalfRaise_reps2: UITextField!
    @IBOutlet weak var standingCalfRaise_lbs2: UITextField!
    
    @IBOutlet weak var standingCalfRaise_reps3: UITextField!
    @IBOutlet weak var standingCalfRaise_lbs3: UITextField!

    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Button Functionality
    
    @IBAction func discardWorkout(_ sender: UIButton) {
        selection.impactOccurred(intensity: 1.0)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func workoutSaved(_ sender: UIButton) {
        //Adds Haptic Feedback to Save Button
        selection.impactOccurred(intensity: 1.0)
        
        
        /**Creates an empty workoutArray when the IBAction is called.
        This is done so that the data saved is stored in an Array**/
        var workoutArray = [LegsModel]()
        
        let newWorkout = LegsModel(dateReference: dateReference,
                                   barbellBackSquat_reps1: barbellBackSquat_reps1.text!,
                                   barbellBackSquat_reps2: barbellBackSquat_reps2.text!,
                                   barbellBackSquat_reps3: barbellBackSquat_reps3.text!,
                                   barbellBackSquat_lbs1: barbellBackSquat_lbs1.text!,
                                   barbellBackSquat_lbs2: barbellBackSquat_lbs2.text!,
                                   barbellBackSquat_lbs3: barbellBackSquat_lbs3.text!,
                                   barbellFrontSquat_reps1: barbellFrontSquat_reps1.text!,
                                   barbellFrontSquat_reps2: barbellFrontSquat_reps2.text!,
                                   barbellFrontSquat_reps3: barbellFrontSquat_reps3.text!,
                                   barbellFrontSquat_lbs1: barbellFrontSquat_lbs1.text!,
                                   barbellFrontSquat_lbs2: barbellFrontSquat_lbs2.text!,
                                   barbellFrontSquat_lbs3: barbellFrontSquat_lbs3.text!,
                                   bulgarianSplitSquat_reps1: bulgarianSplitSquat_reps1.text!,
                                   bulgarianSplitSquat_reps2: bulgarianSplitSquat_reps2.text!,
                                   bulgarianSplitSquat_reps3: bulgarianSplitSquat_reps3.text!,
                                   bulgarianSplitSquat_lbs1: bulgarianSplitSquat_lbs1.text!,
                                   bulgarianSplitSquat_lbs2: bulgarianSplitSquat_lbs2.text!,
                                   bulgarianSplitSquat_lbs3: bulgarianSplitSquat_lbs3.text!,
                                   standingCalfRaise_reps1: standingCalfRaise_reps1.text!,
                                   standingCalfRaise_reps2: standingCalfRaise_reps2.text!,
                                   standingCalfRaise_reps3: standingCalfRaise_reps3.text!,
                                   standingCalfRaise_lbs1: standingCalfRaise_lbs1.text!,
                                   standingCalfRaise_lbs2: standingCalfRaise_lbs2.text!,
                                   standingCalfRaise_lbs3: standingCalfRaise_lbs3.text!)
        
        //Appends the newWorkout struct to the array of pushWorkouts
        workoutArray.append(newWorkout)
        
        //Do and catch block that checks if such a file exists
                do {
                    //Trys to retrieve data from the workout folder as a [PushModel]
                    var loadedWorkouts = try Disk.retrieve("Folder/legsWorkouts.json", from: .caches, as: [LegsModel].self)
        //            var loadedStats = try Disk.retrieve("Folder/pullStats.json", from: .caches, as: PullStats.self)
                    //If successful, appends the new workout to the saved array of [PushModel]
                    loadedWorkouts.append(newWorkout)
                    
        //            //Adds updated stats to the loadedStats file
        //            if loadedStats.flatBarbellBenchPress_1RM < flatBarbellBenchPressMaxs.max()! {
        //                loadedStats.flatBarbellBenchPress_1RM = flatBarbellBenchPressMaxs.max()!
        //            }
                    
                    
                    
                    //Do and catch block that saves the updated loadedWorkout Array
                    do {
                        //Trys to save the data to the same location
                        try Disk.save(loadedWorkouts, to: .caches, as: "Folder/legsWorkouts.json")
        //                try Disk.save(loadedStats, to: .caches, as: "Folder/pullStats.json")
                        print("Data saved to existing file")
                    } catch {
                        print("There has been a major error")
                    }
                    
                } catch {
                    /**If no data has been saved previously, this block creates a new location for the data to be saved to
                    print("You fucked up")**/
                    do {
                        //Trys to save the data to the desired location
                        try Disk.save(workoutArray, to: .caches, as: "Folder/legsWorkouts.json")
                        
        //                //Assigns the stats to a new file
        //                let newStats = PushStats(flatBarbellBenchPress_1RM: flatBarbellBenchPressMaxs.max()!, flatBarbellBenchPress_1RMIncrease: 0.0)
                        
        //                try Disk.save(newStats, to: .caches, as: "Folder/pushStats.json")
                        
                        print("First Record Saved")
                    } catch {
                        print("There has been a major error")
                    }
                }
                
                navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    
    
    
}

