//
//  HouseItemsTableViewController.swift
//  Homies
//
//  Created by Sam Khano on 4/19/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class HouseItemsTableViewController: UITableViewController {

    var neededItem : Int!
    
    @IBOutlet weak var itemsTabController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        neededItem = 0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "addHouseItemSegue") {
            let addItemVC = segue.destinationViewController as! AddHouseItemViewController;
            addItemVC.neededItem = neededItem
        }
    }
    
    @IBAction func itemsTabChanged(sender: AnyObject) {
        neededItem = itemsTabController.selectedSegmentIndex
        if itemsTabController.selectedSegmentIndex == 0 {
            //update need table
        }
        if itemsTabController.selectedSegmentIndex == 1 {
            //update purchased table
        }
    }


}
