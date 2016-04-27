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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changedTab(sender: AnyObject) {
        showWeek = tabController.selectedSegmentIndex
        self.tableView.reloadData()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:  UITableViewCellStyle.Value1, reuseIdentifier: "taskCell")
        
        var curTask : Task!
        if (showWeek == 0) {
            curTask = house.getWeekTasks()[indexPath.row]
            
        } else {
            curTask = house.getMonthTasks()[indexPath.row]
        }

        if (curTask.completed!) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None;
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let _ = user as? ExecutiveUser {
            var curTask : Task!
            if (showWeek == 0) {
                curTask = house.getWeekTasks()[indexPath.row]
                
            } else {
                curTask = house.getMonthTasks()[indexPath.row]
            }
            
            if curTask.completed! {
                curTask.undo()
            } else {
                curTask.complete()
            }
            tableView.reloadData()
        }
    }
}
