//
//  PullModel.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-17.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import Foundation

struct PullModel: Codable, WorkoutModel {
    
    let title = "Pull Workout"
    
    let dateReference: Double
    
    //Barbell Deadlift Data
    let barbellDeadlift_reps1: String
    let barbellDeadlift_reps2: String
    let barbellDeadlift_reps3: String

    let barbellDeadlift_lbs1: String
    let barbellDeadlift_lbs2: String
    let barbellDeadlift_lbs3: String
    
    //Barbell Row Data
    let barbellRow_reps1: String
    let barbellRow_reps2: String
    let barbellRow_reps3: String
    
    let barbellRow_lbs1: String
    let barbellRow_lbs2: String
    let barbellRow_lbs3: String
    
    //Wide-Grip Pullup Data
    let wideGripPullup_reps1: String
    let wideGripPullup_reps2: String
    let wideGripPullup_reps3: String
    
    let wideGripPullup_lbs1: String
    let wideGripPullup_lbs2: String
    let wideGripPullup_lbs3: String
    
    //One-Arm Dumbbell Row Data
    let oneArmDumbbellRow_reps1: String
    let oneArmDumbbellRow_reps2: String
    let oneArmDumbbellRow_reps3: String
    
    let oneArmDumbbellRow_lbs1: String
    let oneArmDumbbellRow_lbs2: String
    let oneArmDumbbellRow_lbs3: String
    
}
