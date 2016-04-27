//
//  TasksTableViewController.swift
//  Homies
//
//  Created by Sam Khano on 4/19/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

    @IBOutlet weak var tabController: UISegmentedControl!
    
    var delegate : LoginDelegate?
    var user : User!
    var house : House!
    var showWeek: Int!
    
    
    //eTaskName : String, eFrequency : Int, eCreatedDate : NSDate, eStartOffset : NSTimeInterval
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = delegate?.getCurrentUser()
        house = user.userHouse
        showWeek = 0
        
        let tasks = [Task.init(eTaskName: "Clean floor", eFrequency: 24*3600 * 5, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 0)),
            Task.init(eTaskName: "Trash", eFrequency: 24*3600 * 10, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 5 * 24 * 3600)),
            Task.init(eTaskName: "Table", eFrequency: 24*3600 * 15, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 10 * 24 * 3600)),
            Task.init(eTaskName: "Chair", eFrequency: 24*3600 * 25, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 15 * 24 * 3600)),
            Task.init(eTaskName: "Toilet", eFrequency: 24*3600 * 30, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 20 * 24 * 3600))]
        
        for task in tasks {
            house.addTask(task)
        }
        
        house.checkResetMonthTasks()
        
//                user.addWantedItem("Toilet Paper")
//                user.addWantedItem("hello")
//                user.addWantedItem("ToilePaper")
//                user.addWantedItem("he")
//                user.boughtItem("bread", cost: 5.00)
//                user.boughtItem("ppj", cost: 3.45)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changedTab(sender: AnyObject) {
//        if tabController.selectedSegmentIndex == 0 {
//            //update week table
//        }
//        if tabController.selectedSegmentIndex == 1 {
//            //update month table
//        }
        showWeek = tabController.selectedSegmentIndex
        self.tableView.reloadData()
    }
    
    //*********
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        neededItem = 0
//        user = delegate?.getCurrentUser()
//        houseObj = user.userHouse
//        
//        user.addWantedItem("Toilet Paper")
//        user.addWantedItem("hello")
//        user.addWantedItem("ToilePaper")
//        user.addWantedItem("he")
//        user.addWantedItem("Toilet Papr")
//        user.addWantedItem("ello")
//        user.addWantedItem("ilePaper")
//        user.addWantedItem("e")
//        user.addWantedItem("aper")
//        user.addWantedItem("o")
//        user.addWantedItem("lePaper")
//        user.addWantedItem("dae")
//        
//        user.boughtItem("bread", cost: 5.00)
//        user.boughtItem("ppj", cost: 3.45)
//        
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    @IBAction func itemsTabChanged(sender: AnyObject) {
//        neededItem = itemsTabController.selectedSegmentIndex
//        self.tableView.reloadData()
//        //        if itemsTabController.selectedSegmentIndex == 0 {
//        //            house.getNeededItems()
//        //        }
//        //        if itemsTabController.selectedSegmentIndex == 1 {
//        //            house.getPurchasedItems()
//        //        }
//    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:  UITableViewCellStyle.Value1, reuseIdentifier: "taskCell")
        var curTask : Task!
        if (showWeek == 0) {
            curTask = house.getWeekTasks()[indexPath.row]
            
        } else {
            curTask = house.getMonthTasks()[indexPath.row]
        }
        cell.textLabel?.text = "\(curTask.taskName) - \(curTask.assignedUser.userName)"
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle

        cell.detailTextLabel?.text = formatter.stringFromDate(curTask.deadline)
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (showWeek == 0) {
            return house.getWeekTasks().count
        } else {
            return house.getMonthTasks().count
        }
    }
    //*********
    
    


}
