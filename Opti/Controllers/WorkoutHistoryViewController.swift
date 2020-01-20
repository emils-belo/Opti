//
//  WorkoutHistoryViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-14.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk


class WorkoutHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Initializing Varibles
    var savedPushData_global: [PushModel] = []
    var savedPullData_global: [PullModel] = []
    var savedLegsData_global: [LegsModel] = []
    
    var savedData: [WorkoutModel] = []
    
    var sortedData_global: [WorkoutModel] = []
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        //Retreving the users saved Data
        savedPushData_global = loadSavedPushData()
        savedPullData_global = loadSavedPullData()
        savedLegsData_global = loadSavedLegsData()
        
        //Combining all saved Push Pull and Legs workouts into one array
        let allWorkoutsArray_global = appendData(pushArray: savedPushData_global, pullArray: savedPullData_global, legsArray: savedLegsData_global)
        
        //Sorting the logged workouts by their timestamps with the newest at the top
        sortedData_global = sortLoadedData(sort: allWorkoutsArray_global)
        
        //Setting thr tableViews delegate and data source
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    //MARK: - Table View Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedData_global.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath)
        cell.textLabel?.text = "\(sortedData_global[indexPath.row].title)"
        let workoutDate = Date.init(timeIntervalSinceReferenceDate: sortedData_global[indexPath.row].dateReference)
        cell.detailTextLabel?.text = "Date: \(workoutDate)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Stores the info of the selected workout in a temporary file
        if sortedData_global[indexPath.row].title == "Push Workout" {
            let pushWorkoutData = sortedData_global[indexPath.row] as! PushModel
            do {
                //Trys to save the data to the desired location
                try Disk.save(pushWorkoutData, to: .caches, as: "Folder/workoutDetails.json")
                print("Temp Data Saved")
            } catch {
                print(error)
            }
        } else if sortedData_global[indexPath.row].title == "Pull Workout" {
            let pullWorkoutData = sortedData_global[indexPath.row] as! PullModel
            do {
                //Trys to save the data to the desired location
                try Disk.save(pullWorkoutData, to: .caches, as: "Folder/workoutDetails.json")
                print("Temp Data Saved")
            } catch {
                print(error)
            }
        } else {
            let legsWorkoutData = sortedData_global[indexPath.row] as! LegsModel
            do {
                //Trys to save the data to the desired location
                try Disk.save(legsWorkoutData, to: .caches, as: "Folder/workoutDetails.json")
                print("Temp Data Saved")
            } catch {
                print(error)
            }
        }
        
        performSegue(withIdentifier: "MoreInfo", sender: self)

    }
}

//MARK: - Data Retrieval Function
extension WorkoutHistoryViewController {
    //This tries to load any saved push workouts
    func loadSavedPushData()-> [PushModel] {
        
        //Makes an empty [PushModel]
        var savedPushData = [PushModel]()
        
        //This do catch block tries to retreived any saved data
        do {
            savedPushData = try Disk.retrieve("Folder/pushWorkouts.json", from: .caches, as: [PushModel].self)
        } catch {
            print("User has not saved any push workouts")
        }
        
        //Returns the data
        return savedPushData
    }
    
    //This tries to load any saved pull workouts
    func loadSavedPullData()-> [PullModel] {
        
        
        //Makes an empty [PullModel]
        var savedPullData = [PullModel]()
        
        //This do catch block tries to retreived any saved data
        do {
            savedPullData = try Disk.retrieve("Folder/pullWorkouts.json", from: .caches, as: [PullModel].self)
        } catch {
            print("User has not saved any pull workouts")
        }
        
        return savedPullData
        
    }
    
    //This tries to load any saved pull workouts
    func loadSavedLegsData()-> [LegsModel] {
        
        //Makes an empty [LegsModel]
        var savedLegsData = [LegsModel]()
        
        //This do catch block tries to retreived any saved data
        do {
            savedLegsData = try Disk.retrieve("Folder/legsWorkouts.json", from: .caches, as: [LegsModel].self)
        } catch {
            print("User has not saved any pull workouts")
        }
        
        return savedLegsData
    }
    
}

//MARK: - Data Sorting Functions
extension WorkoutHistoryViewController {
    //This function sorts the data by the dateReference
    func sortLoadedData(sort unsortedArray: [WorkoutModel]) -> [WorkoutModel] {
        //This method sorts the inputed data by the data reference in descending order
        let sortedData = unsortedArray.sorted(by: {$0.dateReference > $1.dateReference } )
        
        //This returns the sorted data back to the user
        return sortedData
    }
    
    //This function combines the three possibly saved workouts into one array
    func appendData(pushArray: [PushModel], pullArray: [PullModel], legsArray: [LegsModel])-> [WorkoutModel] {
        
        var allWorkoutsArray: [WorkoutModel] = []
        
        //Appends any push workouts
        for workout in pushArray {
            allWorkoutsArray.append(workout)
        }
        
        //Appends any pull workouts
        for workout in pullArray {
            allWorkoutsArray.append(workout)
        }
        
        //Appends any leg workouts
        for workout in legsArray {
            allWorkoutsArray.append(workout)
        }
        
        return allWorkoutsArray
    }
    
}
