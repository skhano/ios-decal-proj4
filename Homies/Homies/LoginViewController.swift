//
//  ViewController.swift
//  Homies
//
//  Created by Sam Khano on 4/18/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

protocol LoginDelegate {
    func getCurrentUser() -> User
}

class LoginViewController: UIViewController, LoginDelegate {

    var users : [User]!
    var houses : [House]!
    var currentUser : User!

    @IBOutlet weak var enteredUserName: UITextField!
    @IBOutlet weak var enteredPassword: UITextField!

    @IBAction func loginButtonPressed(sender: AnyObject) {
        var validEntry = false
        for usr in users {
            if usr.userName == enteredUserName.text && usr.userPassword == enteredPassword.text {
                validEntry = true
                currentUser = usr
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
        houses[0].addUser(users[0])
        houses[0].addUser(users[1])
        houses[0].addUser(users[2])
        houses[0].addUser(users[3])

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCurrentUser() -> User {
        return currentUser
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "houseSegue") {
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let vc = nav.topViewController as! TasksTableViewController
            vc.delegate = self
            
            let nav1 = barViewControllers.viewControllers![1] as! UINavigationController
            let vc1 = nav1.topViewController as! HouseItemsTableViewController
            vc1.delegate = self
            
            let nav2 = barViewControllers.viewControllers![2] as! UINavigationController
            let vc2 = nav2.topViewController as! StatsTableViewController
            vc2.delegate = self
            
            let nav3 = barViewControllers.viewControllers![3] as! UINavigationController
            let vc3 = nav3.topViewController as! ProfileTableViewController
            vc3.delegate = self
            
        }
    }
}

