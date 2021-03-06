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
    var delegate : LoginDelegate?
    var houseObj : House!
    var user : User!
    
    @IBOutlet weak var houseHoldItemsLabel: UILabel!
    
    @IBOutlet weak var itemsTabController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        neededItem = 0
        user = delegate?.getCurrentUser()
        houseObj = user.userHouse
        
        houseObj.users[0].addWantedItem("Toilet Paper")
        houseObj.users[0].addWantedItem("Salt")
        houseObj.users[1].addWantedItem("Vacuum Cleaner")
        houseObj.users[2].addWantedItem("Cooking Oil")
        houseObj.users[3].addWantedItem("Detergent")
        houseObj.users[3].addWantedItem("Pepper")
        houseObj.users[3].addWantedItem("soap")
        
        houseObj.originalUsers[1].boughtItem("bread - sam", cost: 5.00)
        houseObj.originalUsers[4].boughtItem("pbj - bob", cost: 3.45)
        
        
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

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        super.viewWillAppear(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHouseItemsTableViewController(segue: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "addHouseItemSegue") {
            let addItemVC = segue.destinationViewController as! AddHouseItemViewController;
            addItemVC.neededItem = neededItem
            addItemVC.delegate = delegate
        }
    }
    
    @IBAction func itemsTabChanged(sender: AnyObject) {
        neededItem = itemsTabController.selectedSegmentIndex
        self.tableView.reloadData()
//        if itemsTabController.selectedSegmentIndex == 0 {
//            house.getNeededItems()
//        }
//        if itemsTabController.selectedSegmentIndex == 1 {
//            house.getPurchasedItems()
//        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:  UITableViewCellStyle.Value1, reuseIdentifier: "houseHoldItemCell")
        cell.textLabel?.textColor = themeColor.navy
        if (neededItem == 0) {
            cell.backgroundColor = user.userColor
            cell.textLabel?.text = "\(houseObj.getNeededItems()[indexPath.row])"
            cell.detailTextLabel?.text = ""
        } else {
            cell.backgroundColor = user.userColor
            let keys = [String] (houseObj.getPurchasedItems().keys)
            let vals = [Double] (houseObj.getPurchasedItems().values)
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
        if (neededItem == 0) {
            return houseObj.getNeededItems().count
        } else {
            return houseObj.getPurchasedItems().count
        }
    }
}
