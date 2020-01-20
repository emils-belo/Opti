//
//  LegsModel.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-17.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import Foundation

struct LegsModel: Codable, WorkoutModel {
    
    let title = "Legs Workout"
    
    let dateReference: Double
    
    //Barbell Back Squat Data
    let barbellBackSquat_reps1: String
    let barbellBackSquat_reps2: String
    let barbellBackSquat_reps3: String

    let barbellBackSquat_lbs1: String
    let barbellBackSquat_lbs2: String
    let barbellBackSquat_lbs3: String
    
    //Barbell Front Squat Data
    let barbellFrontSquat_reps1: String
    let barbellFrontSquat_reps2: String
    let barbellFrontSquat_reps3: String
    
    let barbellFrontSquat_lbs1: String
    let barbellFrontSquat_lbs2: String
    let barbellFrontSquat_lbs3: String
    
    //Bulgarian Split Squat Data
    let bulgarianSplitSquat_reps1: String
    let bulgarianSplitSquat_reps2: String
    let bulgarianSplitSquat_reps3: String
    
    let bulgarianSplitSquat_lbs1: String
    let bulgarianSplitSquat_lbs2: String
    let bulgarianSplitSquat_lbs3: String
    
    //Standing Calf Raise Data
    let standingCalfRaise_reps1: String
    let standingCalfRaise_reps2: String
    let standingCalfRaise_reps3: String
    
    let standingCalfRaise_lbs1: String
    let standingCalfRaise_lbs2: String
    let standingCalfRaise_lbs3: String
    
}
