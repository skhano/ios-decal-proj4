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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changedTab(sender: AnyObject) {
        if tabController.selectedSegmentIndex == 0 {
            //update week table
        }
        if tabController.selectedSegmentIndex == 1 {
            //update month table
        }
    }
    
    
    


}
