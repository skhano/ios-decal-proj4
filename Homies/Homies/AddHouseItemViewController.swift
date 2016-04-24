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
    
    @IBOutlet weak var enteredItem: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    
    
//  var delegate : ModelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (neededItem == 0) {
            priceLabel.text = ""
        } else {
            priceLabel.text = "Enter Price"
        }
        //saveButton.setTitle("Save", forState: UIControlState.Normal)
    }
    
    
//    @IBAction func DoneButton(sender: UIBarButtonItem) {
//        if let text = userInput.text {
//            if (text != "") {
//                statusLabel.text = "Task Saved!"
//                delegate?.updateModel(text)
//            }
//        }
//    }

}
