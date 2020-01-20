//
//  PushStatsViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-17.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk


class PushStatsViewController: UIViewController {
    
    var savedWorkouts: [PushModel] = []
    
    @IBOutlet weak var flatBarbellBenchPress1RM: UILabel!
    @IBOutlet weak var closeGripBenchPress1RM: UILabel!
    @IBOutlet weak var standingMilitaryPress1RM: UILabel!
    @IBOutlet weak var dumbbellLateralRaise: UILabel!
    
    @IBOutlet weak var workoutsCompleted: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Loads the saved user data and sets it to a variable with a global scope
        loadWorkouts()
        //Sorts through all the data and finds the one rep maxes
        let maxData = getMaxData(savedWorkouts: savedWorkouts)
        //Displays the data through the IBOutlets
        displayData(maxData: maxData)
    }
    
    
    func loadWorkouts() {
        do {
            let loadedWorkouts = try Disk.retrieve("Folder/pushWorkouts.json", from: .caches, as: [PushModel].self)
            savedWorkouts = loadedWorkouts
        } catch {
            print("There has been a major error")
        }
    }
    
    
    func displayData(maxData: [Double]) {
        
        workoutsCompleted.text = "\(savedWorkouts.count)"
        flatBarbellBenchPress1RM.text = String(format: "%.1flbs", maxData[0])
        closeGripBenchPress1RM.text = String(format: "%.1flbs", maxData[1])
        standingMilitaryPress1RM.text = String(format: "%.1flbs", maxData[2])
        dumbbellLateralRaise.text = String(format: "%.1flbs", maxData[3])

    }
    
    
    func getMaxData(savedWorkouts: [PushModel] ) -> [Double] {
        
        //Thie stores the greatest oneRepMaxes of the 4 different exercises
        var oneRep:[Double] = [0,0,0,0]
        
        //This sorts through the saved workouts to find the maxes
        for workout in savedWorkouts {
            
            //This find the one rep max of the first exercise
            var exer1: [Double] = [0,0,0]
            //Set one
            if let exer1_lbs1 = Double(workout.flatBarbellBenchPress_lbs1),
                let exer1_reps1 = Double(workout.flatBarbellBenchPress_reps1) {
                exer1[0] = exer1_lbs1 * (1.0 + exer1_reps1 / 30.0)
            } else {
                exer1[0] = 0.0
            }
            
            //Set two
            if let exer1_lbs2 = Double(workout.flatBarbellBenchPress_lbs2),
                let exer1_reps2 = Double(workout.flatBarbellBenchPress_reps2) {
                exer1[1] = exer1_lbs2 * (1.0 + exer1_reps2 / 30.0)
            } else {
                exer1[1] = 0.0
            }
            
            //Set three
            if let exer1_lbs3 = Double(workout.flatBarbellBenchPress_lbs3),
                let exer1_reps3 = Double(workout.flatBarbellBenchPress_reps3) {
                exer1[2] = exer1_lbs3 * (1.0 + exer1_reps3 / 30.0)
            } else {
                exer1[2] = 0.0
            }
            
            //Updates oneRep array if greater than stored value
            if exer1.max()! > oneRep[0] {
                oneRep[0] = exer1.max()!
            }
            
            
            
            
            //This find the one rep max of the second exercise
            var exer2: [Double] = [0,0]
            /*Set one*/
            if let exer2_lbs1 = Double(workout.closeGripBenchPress_lbs1),
                let exer2_reps1 = Double(workout.closeGripBenchPress_reps1) {
                exer2[0] = exer2_lbs1 * (1.0 + exer2_reps1 / 30.0)
            } else {
                exer2[0] = 0.0
            }
            
            /*Set two*/
            if let exer2_lbs2 = Double(workout.closeGripBenchPress_lbs2),
                let exer2_reps2 = Double(workout.closeGripBenchPress_reps2) {
                exer2[1] = exer2_lbs2 * (1.0 + exer2_reps2 / 30.0)
            } else {
                exer2[1] = 0.0
            }
            
            //Updates oneRep array if greater than stored value
            if exer2.max()! > oneRep[1] {
                oneRep[1] = exer2.max()!
            }
            
            
            
            //This finds the one rep max of the third exercise
            var exer3: [Double] = [0,0]
            /*Set one*/
            if let exer3_lbs1 = Double(workout.standingMillitaryPress_lbs1),
                let exer3_reps1 = Double(workout.standingMillitaryPress_reps1) {
                exer3[0] = exer3_lbs1 * (1.0 + exer3_reps1 / 30.0)
            } else {
                exer3[0] = 0.0
            }
            
            /*Set two*/
            if let exer3_lbs2 = Double(workout.standingMillitaryPress_lbs2),
                let exer3_reps2 = Double(workout.standingMillitaryPress_reps2) {
                exer3[1] = exer3_lbs2 * (1.0 + exer3_reps2 / 30.0)
            } else {
                exer3[1] = 0.0
            }
            
            //Updates oneRep array if greater than stored value
            if exer3.max()! > oneRep[2] {
                oneRep[2] = exer3.max()!
            }
            
            
            
            //This finds the one rep max of the fourth exercise
            var exer4: [Double] = [0,0]
            
            /*Set one*/
            if let exer4_lbs1 = Double(workout.dumbbellLateralRaise_lbs1),
                let exer4_reps1 = Double(workout.dumbbellLateralRaise_reps1) {
                exer4[0] = exer4_lbs1 * (1.0 + exer4_reps1 / 30.0)
            } else {
                exer4[0] = 0.0
            }
            
            /*Set two*/
            if let exer4_lbs2 = Double(workout.dumbbellLateralRaise_lbs2),
                let exer4_reps2 = Double(workout.dumbbellLateralRaise_reps2) {
                exer4[1] = exer4_lbs2 * (1.0 + exer4_reps2 / 30.0)
            } else {
                exer4[1] = 0.0
            }
            
            //Updates oneRep array if greater than stored value
            if exer4.max()! > oneRep[3] {
                oneRep[3] = exer4.max()!
            }
        }
        
    return oneRep
    }
    
}

