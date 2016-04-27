//
//  AddHouseItemViewController.swift
//  Homies
//
//  Created by Sam Khano on 4/19/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class AddHouseItemViewController: UIViewController {
    
    var neededItem : Int!
    var delegate : LoginDelegate?
    
    @IBOutlet weak var enteredItem: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var price: UITextField!
    
    //var defaults : NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (neededItem == 0) {
            priceLabel.text = ""
        } else {
            priceLabel.text = "Enter Price"
        }
//        defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject((delegate?.getCurrentUser().userName)!)
        //saveButton.setTitle("Save", forState: UIControlState.Normal)
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        if (neededItem == 0) {
            delegate?.getCurrentUser().addWantedItem(enteredItem.text!)
        } else {
            delegate?.getCurrentUser().boughtItem(enteredItem.text!, cost: (price.text! as NSString).doubleValue)
        }
//        defaults.setObject(delegate?.getCurrentUser(), forKey: (delegate?.getCurrentUser().userName)!)
    }
    
}
