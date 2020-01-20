//
//  MoreInfoViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-18.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk

class MoreInfoViewController: UIViewController {
    
    var pullDetails_global: PullModel?
    var pushDetails_global: PushModel?
    var legsDetails_global: LegsModel?
    
    //Background Layout IBOutlet
    @IBOutlet weak var backgroundLayout: UIImageView!

    //Exercise 1 IBOutletslets
    @IBOutlet weak var exercise1_reps1: UITextField!
    @IBOutlet weak var exercise1_lbs1: UITextField!
    
    @IBOutlet weak var exercise1_reps2: UITextField!
    @IBOutlet weak var exercise1_lbs2: UITextField!
    
    @IBOutlet weak var exercise1_reps3: UITextField!
    @IBOutlet weak var exercise1_lbs3: UITextField!
    
    //Exercise 2 IBOutlets
    @IBOutlet weak var exercise2_reps1: UITextField!
    @IBOutlet weak var exercise2_lbs1: UITextField!
    
    @IBOutlet weak var exercise2_reps2: UITextField!
    @IBOutlet weak var exercise2_lbs2: UITextField!
    
    @IBOutlet weak var exercise2_reps3: UITextField!
    @IBOutlet weak var exercise2_lbs3: UITextField!
    
    //Exercise 3 IBOutlets
    @IBOutlet weak var exercise3_reps1: UITextField!
    @IBOutlet weak var exercise3_lbs1: UITextField!
    
    @IBOutlet weak var exercise3_reps2: UITextField!
    @IBOutlet weak var exercise3_lbs2: UITextField!
    
    @IBOutlet weak var exercise3_reps3: UITextField!
    @IBOutlet weak var exercise3_lbs3: UITextField!
    
    //Exercise 4 IBOutlets
    @IBOutlet weak var exercise4_reps1: UITextField!
    @IBOutlet weak var exercise4_lbs1: UITextField!
    
    @IBOutlet weak var exercise4_reps2: UITextField!
    @IBOutlet weak var exercise4_lbs2: UITextField!
    
    @IBOutlet weak var exercise4_reps3: UITextField!
    @IBOutlet weak var exercise4_lbs3: UITextField!
    
    
    
    var workoutType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetails()
        
        backgroundLayout.image = UIImage(named: "\(workoutType) History")
        
        displayData()
        
    }
    
    
    func displayData() {
        if workoutType == "Push" {
            //Display Data for Exercise 1
            exercise1_reps1.text = pushDetails_global?.flatBarbellBenchPress_reps1
            exercise1_lbs1.text = pushDetails_global?.flatBarbellBenchPress_lbs1
            
            exercise1_reps2.text = pushDetails_global?.flatBarbellBenchPress_reps2
            exercise1_lbs2.text = pushDetails_global?.flatBarbellBenchPress_lbs2
            
            exercise1_reps3.text = pushDetails_global?.flatBarbellBenchPress_reps3
            exercise1_lbs3.text = pushDetails_global?.flatBarbellBenchPress_lbs3
            
            //Display Data for Exercise 2
            exercise2_reps1.text = pushDetails_global?.closeGripBenchPress_reps1
            exercise2_lbs1.text = pushDetails_global?.closeGripBenchPress_lbs1
            
            exercise2_reps2.text = pushDetails_global?.closeGripBenchPress_reps2
            exercise2_lbs2.text = pushDetails_global?.closeGripBenchPress_lbs2
            
            exercise2_reps3.text = ""
            exercise2_lbs3.text = ""
            
            //Display Data for Exercise 3
            exercise3_reps1.text = pushDetails_global?.standingMillitaryPress_reps1
            exercise3_lbs1.text = pushDetails_global?.standingMillitaryPress_lbs1
            
            exercise3_reps2.text = pushDetails_global?.standingMillitaryPress_reps2
            exercise3_lbs2.text = pushDetails_global?.standingMillitaryPress_lbs2
            
            exercise3_reps3.text = ""
            exercise3_lbs3.text = ""
            
            //Display Data for Exercise 4
            
            exercise4_reps1.text = pushDetails_global?.dumbbellLateralRaise_reps1
            exercise4_lbs1.text = pushDetails_global?.dumbbellLateralRaise_lbs1
            
            exercise4_reps2.text = pushDetails_global?.dumbbellLateralRaise_reps2
            exercise4_lbs2.text = pushDetails_global?.dumbbellLateralRaise_lbs2
            
            exercise4_reps3.text = ""
            exercise4_lbs3.text = ""
        } else if workoutType == "Pull" {
            //Display Data for Exercise 1
            exercise1_reps1.text = pullDetails_global?.barbellDeadlift_reps1
            exercise1_lbs1.text = pullDetails_global?.barbellDeadlift_lbs1
            
            exercise1_reps2.text = pullDetails_global?.barbellDeadlift_reps2
            exercise1_lbs2.text = pullDetails_global?.barbellDeadlift_lbs2
            
            exercise1_reps3.text = pullDetails_global?.barbellDeadlift_reps3
            exercise1_lbs3.text = pullDetails_global?.barbellDeadlift_lbs3
            
            //Display Data for Exercise 2
            exercise2_reps1.text = pullDetails_global?.barbellRow_reps1
            exercise2_lbs1.text = pullDetails_global?.barbellRow_lbs1
            
            exercise2_reps2.text = pullDetails_global?.barbellRow_reps2
            exercise2_lbs2.text = pullDetails_global?.barbellRow_lbs2
            
            exercise2_reps3.text = pullDetails_global?.barbellRow_reps3
            exercise2_lbs3.text = pullDetails_global?.barbellRow_lbs3
            
            //Display Data for Exercise 3
            exercise3_reps1.text = pullDetails_global?.wideGripPullup_reps1
            exercise3_lbs1.text = pullDetails_global?.wideGripPullup_lbs1
            
            exercise3_reps2.text = pullDetails_global?.wideGripPullup_reps2
            exercise3_lbs2.text = pullDetails_global?.wideGripPullup_lbs2
            
            exercise3_reps3.text = pullDetails_global?.wideGripPullup_reps3
            exercise3_lbs3.text = pullDetails_global?.wideGripPullup_lbs3
            
            //Display Data for Exercise 4
            exercise4_reps1.text = pullDetails_global?.oneArmDumbbellRow_reps1
            exercise4_lbs1.text = pullDetails_global?.oneArmDumbbellRow_lbs1
            
            exercise4_reps2.text = pullDetails_global?.oneArmDumbbellRow_reps2
            exercise4_lbs2.text = pullDetails_global?.oneArmDumbbellRow_lbs2
            
            exercise4_reps3.text = pullDetails_global?.oneArmDumbbellRow_reps3
            exercise4_lbs3.text = pullDetails_global?.oneArmDumbbellRow_lbs3
        } else {
            //Display Data for Exercise 1
            exercise1_reps1.text = legsDetails_global?.barbellBackSquat_reps1
            exercise1_lbs1.text = legsDetails_global?.barbellBackSquat_lbs1
            
            exercise1_reps2.text = legsDetails_global?.barbellBackSquat_reps2
            exercise1_lbs2.text = legsDetails_global?.barbellBackSquat_lbs2
            
            exercise1_reps3.text = legsDetails_global?.barbellBackSquat_reps3
            exercise1_lbs3.text = legsDetails_global?.barbellBackSquat_lbs3
            
            //Display Data for Exercise 2
            exercise2_reps1.text = legsDetails_global?.barbellFrontSquat_reps1
            exercise2_lbs1.text = legsDetails_global?.barbellFrontSquat_lbs1
            
            exercise2_reps2.text = legsDetails_global?.barbellFrontSquat_reps2
            exercise2_lbs2.text = legsDetails_global?.barbellFrontSquat_lbs2
            
            exercise2_reps3.text = legsDetails_global?.barbellFrontSquat_reps3
            exercise2_lbs3.text = legsDetails_global?.barbellFrontSquat_lbs3
            
            //Display Data for Exercise 3
            exercise3_reps1.text = legsDetails_global?.bulgarianSplitSquat_reps1
            exercise3_lbs1.text = legsDetails_global?.bulgarianSplitSquat_lbs1
            
            exercise3_reps2.text = legsDetails_global?.bulgarianSplitSquat_reps2
            exercise3_lbs2.text = legsDetails_global?.bulgarianSplitSquat_lbs2
            
            exercise3_reps3.text = legsDetails_global?.bulgarianSplitSquat_reps3
            exercise3_lbs3.text = legsDetails_global?.bulgarianSplitSquat_lbs3
            
            //Display Data for Exercise 4
            exercise4_reps1.text = legsDetails_global?.standingCalfRaise_reps1
            exercise4_lbs1.text = legsDetails_global?.standingCalfRaise_lbs1
            
            exercise4_reps2.text = legsDetails_global?.standingCalfRaise_reps2
            exercise4_lbs2.text = legsDetails_global?.standingCalfRaise_lbs2
            
            exercise4_reps3.text = legsDetails_global?.standingCalfRaise_reps3
            exercise4_lbs3.text = legsDetails_global?.standingCalfRaise_lbs3
        }
    }
    
    
    
    
    func loadDetails() {
        
        do {
            //Trys to retrieve data from the workout folder as a [PushModel]
            let workoutDetails = try Disk.retrieve("Folder/workoutDetails.json", from: .caches, as: PushModel.self)
            //If successful, appends the new workout to the saved array of [PushModel]
            pushDetails_global = workoutDetails
            workoutType = "Push"
            print("You loaded a push Workout")
            
        } catch {
            
            do {
                //Trys to retrieve data from the workout folder as a [PushModel]
                let workoutDetails = try Disk.retrieve("Folder/workoutDetails.json", from: .caches, as: PullModel.self)
                //If successful, appends the new workout to the saved array of [PushModel]
                pullDetails_global = workoutDetails
                workoutType = "Pull"
                print("You loaded a pull workout")
            } catch {
                
                do {
                    let workoutDetails = try Disk.retrieve("Folder/workoutDetails.json", from: .caches, as: LegsModel.self)
                    legsDetails_global = workoutDetails
                    workoutType = "Legs"
                    print("You loaded a legs workout")
                } catch{
                    print("There was a major error")
                }
            }
        }
        
        //Delete the temporary data stored in the cache
        do {
            //Trys to save the data to the same location
            try Disk.remove("Folder/workoutDetails.json", from: .caches)
            print("Details successfuly removed from cache")
            print("This should be the last thing you see")
        } catch {
            print("There has been a major error")
        }
        
    }
    
}
