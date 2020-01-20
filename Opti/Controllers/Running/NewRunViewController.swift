//
//  NewRunViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-16.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk

class NewRunViewController: UIViewController {
    
    
    let dateReference = NSDate.timeIntervalSinceReferenceDate
    
    @IBOutlet weak var runDate: UIDatePicker!
       @IBOutlet weak var runTime: UITextField!
       @IBOutlet weak var runDistance: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runDistance.keyboardType = .decimalPad
    }
    
    
   
    
    
    @IBAction func saveNewRun(_ sender: UIButton) {
        
        //Implement Saving Functionality
        /**Creates an empty runArray when the IBAction is called.
        This is done so that the data saved is stored in an Array**/
        var runArray = [RunModel]()
        
        //Adds the run data to a constant
        let newRun = RunModel(dateReference: dateReference, runDistance: runDistance.text!, runTime: runTime.text!, runDate: runDate.date)
        
        //Appends the newRun struct to the array of RunModel's
        runArray.append(newRun)
        
        //Do and catch block that checks if such a file exists
        do {
            //Trys to retrieve data from the run file as a [RunModel]
            var loadedRuns = try Disk.retrieve("Folder/savedRuns.json", from: .caches, as: [RunModel].self)
            //If successful, appends the new run to the saved array of [RunModel]
            loadedRuns.append(newRun)
            
            //Do and catch block that saves the updated loadedRuns Array
            do {
                //Trys to save the data to the same location
                try Disk.save(loadedRuns, to: .caches, as: "Folder/savedRuns.json")
                print("Data saved to existing file")
            } catch {
                print("There has been a major error")
            }
            
        } catch {
            /**If no data has been saved previously, this block creates a new location for the data to be saved to)**/
            do {
                //Trys to save the data to the desired location
                try Disk.save(runArray, to: .caches, as: "Folder/savedRuns.json")
                print("First Record Saved")
            } catch {
                print("There has been a major error")
            }
        }
       
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func discardNewRun(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
}
