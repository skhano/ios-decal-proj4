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
   // @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var price: UITextField!
    
    //var defaults : NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (neededItem == 0) {
      //      priceLabel.text = ""
            price.placeholder = ""
            price.borderStyle = UITextBorderStyle.None
        } else {
      //      priceLabel.text = "Enter Price"
            price.placeholder = "Enter Price"
            price.borderStyle = UITextBorderStyle.RoundedRect
        }
//        defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject((delegate?.getCurrentUser().userName)!)
        //saveButton.setTitle("Save", forState: UIControlState.Normal)
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        let user = delegate?.getCurrentUser()
        if (neededItem == 0) {
            user!.addWantedItem(enteredItem.text!)
        } else {
            user!.boughtItem("\(enteredItem.text!) - \(user!.userName)", cost: (price.text! as NSString).doubleValue)
        }
//        defaults.setObject(delegate?.getCurrentUser(), forKey: (delegate?.getCurrentUser().userName)!)
    }
    
}
