//
//  PushWorkout.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-13.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk

class PushWorkoutViewController: UIViewController{
    
    let selection = UIImpactFeedbackGenerator()
    
    let dateReference = NSDate.timeIntervalSinceReferenceDate
    
    //MARK: - IBOutlets
    //Flat Barbell Bench Press IBOutlets
    @IBOutlet weak var flatBarbellBenchPress_reps1: UITextField!
    
    @IBOutlet weak var flatBarbellBenchPress_lbs1: UITextField!

    
    
    @IBOutlet weak var flatBarbellBenchPress_reps2: UITextField!
    @IBOutlet weak var flatBarbellBenchPress_lbs2: UITextField!
    
    @IBOutlet weak var flatBarbellBenchPress_reps3: UITextField!
    @IBOutlet weak var flatBarbellBenchPress_lbs3: UITextField!
    
    //Close Grip Bench Press IBOutlets
    @IBOutlet weak var closeGripBenchPress_reps1: UITextField!
    @IBOutlet weak var closeGripBenchPress_lbs1: UITextField!
    
    @IBOutlet weak var closeGripBenchPress_reps2: UITextField!
    @IBOutlet weak var closeGripBenchPress_lbs2: UITextField!
    
    //Standing Military Press IBOutlets
    @IBOutlet weak var standingMilitaryPress_reps1: UITextField!
    @IBOutlet weak var standingMilitaryPress_lbs1: UITextField!
    
    @IBOutlet weak var standingMilitaryPress_reps2: UITextField!
    @IBOutlet weak var standingMilitaryPress_lbs2: UITextField!
    
    //Dumbbell Lateral Raise IBOutlets
    @IBOutlet weak var dumbbellLateralRaise_reps1: UITextField!
    @IBOutlet weak var dumbbellLateralRaise_lbs1: UITextField!
    
    @IBOutlet weak var dumbbellLateralRaise_reps2: UITextField!
    @IBOutlet weak var dumbbellLateralRaise_lbs2: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        flatBarbellBenchPress_lbs1.keyboardType = .numberPad
        flatBarbellBenchPress_reps1.keyboardType = .numberPad
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func discardWorkout(_ sender: UIButton) {
        selection.impactOccurred(intensity: 1.0)
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - Saving the workout
    @IBAction func workoutSaved(_ sender: UIButton) {
        //Adds Haptic Feedback to Save Button
        selection.impactOccurred(intensity: 1.0)
        
        /**Creates an empty workoutArray when the IBAction is called.
        This is done so that the data saved is stored in an Array**/
        var workoutArray = [PushModel]()
        
        //Adds the workout data to a constant
        let newWorkout = PushModel(dateReference: dateReference,
            flatBarbellBenchPress_reps1: flatBarbellBenchPress_reps1.text!,
            flatBarbellBenchPress_reps2: flatBarbellBenchPress_reps2.text!,
            flatBarbellBenchPress_reps3: flatBarbellBenchPress_reps3.text!,
            flatBarbellBenchPress_lbs1: flatBarbellBenchPress_lbs1.text!,
            flatBarbellBenchPress_lbs2: flatBarbellBenchPress_lbs2.text!,
            flatBarbellBenchPress_lbs3: flatBarbellBenchPress_lbs3.text!,
            closeGripBenchPress_reps1: closeGripBenchPress_reps1.text!,
            closeGripBenchPress_reps2: closeGripBenchPress_reps2.text!,
            closeGripBenchPress_lbs1: closeGripBenchPress_lbs1.text!,
            closeGripBenchPress_lbs2: closeGripBenchPress_lbs2.text!,
            standingMillitaryPress_reps1: standingMilitaryPress_reps1.text!,
            standingMillitaryPress_reps2: standingMilitaryPress_reps2.text!,
            standingMillitaryPress_lbs1: standingMilitaryPress_lbs1.text!,
            standingMillitaryPress_lbs2: standingMilitaryPress_lbs2.text!,
            dumbbellLateralRaise_reps1: dumbbellLateralRaise_reps1.text!,
            dumbbellLateralRaise_reps2: dumbbellLateralRaise_reps2.text!,
            dumbbellLateralRaise_lbs1: dumbbellLateralRaise_lbs1.text!,
            dumbbellLateralRaise_lbs2: dumbbellLateralRaise_lbs2.text!)
        
        //Appends the newWorkout struct to the array of pushWorkouts
        workoutArray.append(newWorkout)
        
        //Do and catch block that checks if such a file exists
        do {
            //Trys to retrieve data from the workout folder as a [PushModel]
            var loadedWorkouts = try Disk.retrieve("Folder/pushWorkouts.json", from: .caches, as: [PushModel].self)

            loadedWorkouts.append(newWorkout)
            
            //Do and catch block that saves the updated loadedWorkout Array
            do {
                //Trys to save the data to the same location
                try Disk.save(loadedWorkouts, to: .caches, as: "Folder/pushWorkouts.json")
                print("Data saved to existing file")
            } catch {
                print("There has been a major error")
            }
            
        } catch {
            /**If no data has been saved previously, this block creates a new location for the data to be saved to**/
            do {
                //Trys to save the data to the desired location
                try Disk.save(workoutArray, to: .caches, as: "Folder/pushWorkouts.json")
                print("First Record Saved")
            } catch {
                print(error)
            }
        }
        
        navigationController?.popToRootViewController(animated: true)


    }
    
}

