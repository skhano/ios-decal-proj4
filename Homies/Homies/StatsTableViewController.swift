//
//  StatsTableViewController.swift
//  Homies
//
//  Created by Eva on 4/24/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class StatsTableViewController: UITableViewController {

    var delegate : LoginDelegate?
    var user : User!
    var house : House!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = delegate?.getCurrentUser()
        house = user.userHouse
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:  UITableViewCellStyle.Value1, reuseIdentifier: "statCell")
        let curUser = house.getSortedUsers()[indexPath.row]
        cell.textLabel?.text = curUser.userName
        cell.detailTextLabel?.text = String(curUser.score)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return house.getSortedUsers().count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "garbageSegue") {
            let garbageVC = segue.destinationViewController as! GarbageViewController;
            garbageVC.delegate = delegate
        }
    }
    
    
}