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
    var tasks : [Task]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = delegate?.getCurrentUser()
        house = user.userHouse
        showWeek = 0
        
        tasks = [Task.init(eTaskName: "Clean floor", eFrequency: 24*3600 * 3, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 3)),
            Task.init(eTaskName: "Take out trash", eFrequency: 24*3600 * 4, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 1 * 24 * 3600)),
            Task.init(eTaskName: "Collect rent", eFrequency: 24*3600 * 4, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 6 * 24 * 3600)),
            Task.init(eTaskName: "Organize storage", eFrequency: 24*3600 * 5, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 8 * 24 * 3600)),
            Task.init(eTaskName: "clean fridge", eFrequency: 24*3600 * 6, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 8 * 24 * 3600)),
            Task.init(eTaskName: "Wash dishes", eFrequency: 24*3600 * 6, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 8 * 24 * 3600)),
            Task.init(eTaskName: "Clean toilet", eFrequency: 24*3600 * 30, eCreatedDate: NSDate(), eDeadline: NSDate(timeIntervalSinceNow: 7 * 24 * 3600))]
        
        for task in tasks {
            house.addTask(task)
        }
        
        house.checkResetMonthTasks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToDoTableViewController(segue: UIStoryboardSegue) {
    }
    
    @IBAction func changedTab(sender: AnyObject) {
        showWeek = tabController.selectedSegmentIndex
        self.tableView.reloadData()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    
        if let _ = user as? ExecutiveUser {
            if (segue.identifier == "addTaskSegue") {
                let addTaskVC = segue.destinationViewController as! AddTaskViewController;
                addTaskVC.delegate = delegate
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:  UITableViewCellStyle.Value1, reuseIdentifier: "taskCell")
        
        cell.textLabel?.textColor = themeColor.navy
        
        var curTask : Task!
        if (showWeek == 0) {
            curTask = house.getWeekTasks()[indexPath.row]
            
        } else {
            curTask = house.getMonthTasks()[indexPath.row]
        }

        if (curTask.completed!) {
            cell.tintColor = UIColor.grayColor()
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None;
        }

        cell.textLabel?.text = "\(curTask.taskName) - \(curTask.assignedUser.userName)"
        cell.backgroundColor = curTask.assignedUser.userColor
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
