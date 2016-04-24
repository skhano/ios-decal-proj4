//
//  ViewController.swift
//  Homies
//
//  Created by Sam Khano on 4/18/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var users : [User]!
    var houses : [House]!

    @IBOutlet weak var enteredUserName: UITextField!
    @IBOutlet weak var enteredPassword: UITextField!

    @IBAction func loginButtonPressed(sender: AnyObject) {
        var validEntry = false
        for usr in users {
            if usr.userName == enteredUserName.text && usr.userPassword == enteredPassword.text {
                validEntry = true
            }
        }
        if !(validEntry) {
            let alert = UIAlertController(title: "Error", message: "Error: Incorrect Login Information", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            enteredUserName.text = ""
            enteredPassword.text = ""
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        houses = [House.init(eHouseName: "berkeleyhome", eCreatedDate: NSDate())]
        users = [ExecutiveUser.init(enteredName: "eva", enteredPassword: "eva", enteredHouse: houses[0]), User.init(enteredName: "sam", enteredPassword: "sam", enteredHouse: houses[0]), User.init(enteredName: "mike", enteredPassword: "mike", enteredHouse: houses[0]), User.init(enteredName: "jane", enteredPassword: "jane", enteredHouse: houses[0]), User.init(enteredName: "bob", enteredPassword: "bob", enteredHouse: houses[0])]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

