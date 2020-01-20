//
//  PushModel.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-13.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import Foundation

struct PushModel: Codable, WorkoutModel {
    
    var title = "Push Workout"
    
    var dateReference: Double = 0.0
    
    //Flat Barbell Bench Press Data
    let flatBarbellBenchPress_reps1: String
    let flatBarbellBenchPress_reps2: String
    let flatBarbellBenchPress_reps3: String

    let flatBarbellBenchPress_lbs1: String
    let flatBarbellBenchPress_lbs2: String
    let flatBarbellBenchPress_lbs3: String
    
    //Close-Grip Bench Press Data
    let closeGripBenchPress_reps1: String
    let closeGripBenchPress_reps2: String
    
    let closeGripBenchPress_lbs1: String
    let closeGripBenchPress_lbs2: String
    
    //Standing Millitary Press Data
    let standingMillitaryPress_reps1: String
    let standingMillitaryPress_reps2: String
    
    let standingMillitaryPress_lbs1: String
    let standingMillitaryPress_lbs2: String
    
    //Dumbbell Lateral Raise Data
    let dumbbellLateralRaise_reps1: String
    let dumbbellLateralRaise_reps2: String
    
    let dumbbellLateralRaise_lbs1: String
    let dumbbellLateralRaise_lbs2: String
    
    
    
}
