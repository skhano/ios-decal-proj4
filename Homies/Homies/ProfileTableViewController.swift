
//
//  ProfileTableViewController.swift
//  Homies
//
//  Created by Eva on 4/24/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    var delegate : LoginDelegate?
    var user : User!
    var house : House!
    var tab : Int!
    var userTasksCompleted : [Task]!
    
    @IBOutlet weak var profileTabController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = delegate?.getCurrentUser()
        house = user.userHouse
        tab = 0
        userTasksCompleted = user.tasksCompleted.reverse()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tabController(sender: AnyObject) {
        tab = profileTabController.selectedSegmentIndex
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:  UITableViewCellStyle.Value1, reuseIdentifier: "profileCell")
        if (tab == 0) {
            let currTask = userTasksCompleted[indexPath.row]
            cell.textLabel?.text = "\(currTask.taskName)"
            
            let formatter = NSDateFormatter()
            formatter.dateStyle = .ShortStyle
            
            cell.detailTextLabel?.text = formatter.stringFromDate(currTask.completedDate)
        } else {
            let keys = [String] (user.itemsBought.keys)
            let vals = [Double] (user.itemsBought.values)
            if (indexPath.row >= keys.count) {
                return cell;
            }
            let item = keys[indexPath.row]
            let price = vals[indexPath.row]
            cell.textLabel?.text = "\(item)"
            cell.detailTextLabel?.text = "$\(price)"
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tab == 0) {
            userTasksCompleted = user.tasksCompleted.reverse()
            return userTasksCompleted.count
        } else {
            return user.itemsBought.count
        }
    }

    
}