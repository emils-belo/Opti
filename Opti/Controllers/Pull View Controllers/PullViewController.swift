//
//  PullViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-17.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk

class PullViewController: UIViewController {
    
    
    
    let selection = UIImpactFeedbackGenerator()
    let dateReference = NSDate.timeIntervalSinceReferenceDate
    
    //MARK: - IBOutlets
    //Barbell Deadlift IBOutlets
    @IBOutlet weak var barbellDeadlift_reps1: UITextField!
    @IBOutlet weak var barbellDeadlift_lbs1: UITextField!
    
    @IBOutlet weak var barbellDeadlift_reps2: UITextField!
    @IBOutlet weak var barbellDeadlift_lbs2: UITextField!
    
    @IBOutlet weak var barbellDeadlift_reps3: UITextField!
    @IBOutlet weak var barbellDeadlift_lbs3: UITextField!
    
    //Barbell Row IBOutlets
    @IBOutlet weak var barbellRow_reps1: UITextField!
    @IBOutlet weak var barbellRow_lbs1: UITextField!
    
    @IBOutlet weak var barbellRow_reps2: UITextField!
    @IBOutlet weak var barbellRow_lbs2: UITextField!
    
    
    @IBOutlet weak var barbellRow_reps3: UITextField!
    @IBOutlet weak var barbellRow_lbs3: UITextField!
    
    //Wide-Grip Pullup IBOutlets
    @IBOutlet weak var wideGripPullup_reps1: UITextField!
    @IBOutlet weak var wideGripPullup_lbs1: UITextField!
    
    @IBOutlet weak var wideGripPullup_reps2: UITextField!
    @IBOutlet weak var wideGripPullup_lbs2: UITextField!
    
    @IBOutlet weak var wideGripPullup_reps3: UITextField!
    @IBOutlet weak var wideGripPullup_lbs3: UITextField!
    
    //One-Arm Dumbbell Row IBOutlets
    @IBOutlet weak var oneArmDumbbellRow_reps1: UITextField!
    @IBOutlet weak var oneArmDumbbellRow_lbs1: UITextField!
    
    @IBOutlet weak var oneArmDumbbellRow_reps2: UITextField!
    @IBOutlet weak var oneArmDumbbellRow_lbs2: UITextField!
    
    @IBOutlet weak var oneArmDumbbellRow_reps3: UITextField!
    @IBOutlet weak var oneArmDumbbellRow_lbs3: UITextField!
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        //Set the keyboard Appearences
        
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
        var workoutArray = [PullModel]()
        
        
        //Adds the workout data to a constant
        let newWorkout = PullModel(dateReference: dateReference,
                                   barbellDeadlift_reps1: barbellDeadlift_reps1.text!,
                                   barbellDeadlift_reps2: barbellDeadlift_reps2.text!,
                                   barbellDeadlift_reps3: barbellDeadlift_reps3.text!,
                                   barbellDeadlift_lbs1: barbellDeadlift_lbs1.text!,
                                   barbellDeadlift_lbs2: barbellDeadlift_lbs2.text!,
                                   barbellDeadlift_lbs3: barbellDeadlift_lbs3.text!,
                                   barbellRow_reps1: barbellRow_reps1.text!,
                                   barbellRow_reps2: barbellRow_reps2.text!,
                                   barbellRow_reps3: barbellRow_reps3.text!,
                                   barbellRow_lbs1: barbellRow_lbs1.text!,
                                   barbellRow_lbs2: barbellRow_lbs2.text!,
                                   barbellRow_lbs3: barbellRow_lbs3.text!,
                                   wideGripPullup_reps1: wideGripPullup_reps1.text!,
                                   wideGripPullup_reps2: wideGripPullup_reps2.text!,
                                   wideGripPullup_reps3: wideGripPullup_reps3.text!,
                                   wideGripPullup_lbs1: wideGripPullup_lbs1.text!,
                                   wideGripPullup_lbs2: wideGripPullup_lbs2.text!,
                                   wideGripPullup_lbs3: wideGripPullup_lbs3.text!,
                                   oneArmDumbbellRow_reps1: oneArmDumbbellRow_reps1.text!,
                                   oneArmDumbbellRow_reps2: oneArmDumbbellRow_reps2.text!,
                                   oneArmDumbbellRow_reps3: oneArmDumbbellRow_reps3.text!,
                                   oneArmDumbbellRow_lbs1: oneArmDumbbellRow_lbs1.text!,
                                   oneArmDumbbellRow_lbs2: oneArmDumbbellRow_lbs2.text!,
                                   oneArmDumbbellRow_lbs3: oneArmDumbbellRow_lbs3.text!)
        
        //Implement 1RM Stuff
        
       
        workoutArray.append(newWorkout)
        
        //Do and catch block that checks if such a file exists
        do {
            //Trys to retrieve data from the workout folder as a [PushModel]
            var loadedWorkouts = try Disk.retrieve("Folder/pullWorkouts.json", from: .caches, as: [PullModel].self)
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
                try Disk.save(loadedWorkouts, to: .caches, as: "Folder/pullWorkouts.json")
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
                try Disk.save(workoutArray, to: .caches, as: "Folder/pullWorkouts.json")
                
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
//MARK: - One Rep Max Calculator
extension PullViewController {
    func oneRepMax(reps: Double, weight: Double ) -> Double {
        let oneRepMax = weight * (1.0 + reps / 30.0)
        let oneRepMaxString = String(format: "%d.2", oneRepMax)
        print(oneRepMaxString)
        return oneRepMax
    }
}

