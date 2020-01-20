//
//  RunHistoryViewController.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-16.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import UIKit
import Disk

class RunHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var savedData_global: [RunModel] = []
    var sortedData_global: [RunModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        //Load the data and save it to a variable
        savedData_global = loadSavedData()
        
        //Pass that variable to the sorting function which sorts the workouts by their data reference
        sortedData_global = sortLoadedData(sort: savedData_global)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedData_global.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RunCell", for: indexPath)
        cell.textLabel?.text = "Run: \(sortedData_global[indexPath.row].runDate)"
        
        cell.textLabel?.text = "\(sortedData_global[indexPath.row].runDistance)Km in \(sortedData_global[indexPath.row].runTime)"
        cell.detailTextLabel?.text = "Date: \(sortedData_global[indexPath.row].runDate)"
        return cell
    }
    
    
}


//MARK: - Data Retrieval Function
extension RunHistoryViewController {
    //This tries to load any saved data and handles an event if no data can be found
    func loadSavedData()-> [RunModel] {
        //Makes an empty [PushModel]
        var savedData = [RunModel]()
        
        //This do catch block tries to retreived any saved data
        do {
            savedData = try Disk.retrieve("Folder/savedRuns.json", from: .caches, as: [RunModel].self)
        } catch {
            print("No data found")
            //Give the user some feedback regrading this event
        }
        
        //Returns the data
        return savedData
    }
}
//MARK: - Data Sorting Function
extension RunHistoryViewController {
    //This function sorts the data by the dateReference
    func sortLoadedData(sort unsortedArray: [RunModel]) -> [RunModel] {
            //This method sorts the inputed data by the data reference in descending order
            let sortedData = unsortedArray.sorted(by: {$0.dateReference > $1.dateReference } )
            return sortedData
        }
}

