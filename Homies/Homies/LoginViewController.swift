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
        users = [ExecutiveUser.init(enteredName: "eva", enteredPassword: "eva", enteredHouse: houses[0], enteredColor: UIColor(red:1.00, green:0.99, blue:0.85, alpha:1.0)), User.init(enteredName: "sam", enteredPassword: "sam", enteredHouse: houses[0], enteredColor: UIColor(red:1.00, green:0.70, blue:0.57, alpha:1.0)), User.init(enteredName: "mike", enteredPassword: "mike", enteredHouse: houses[0], enteredColor: UIColor(red:0.88, green:0.76, blue:0.91, alpha:1.0)), User.init(enteredName: "jane", enteredPassword: "jane", enteredHouse: houses[0], enteredColor: UIColor(red:0.78, green:0.88, blue:1.00, alpha:1.0)), User.init(enteredName: "bob", enteredPassword: "bob", enteredHouse: houses[0], enteredColor: UIColor(red:0.67, green:0.91, blue:0.74, alpha:1.0))]
        houses[0].addUser(users[0])
        houses[0].addUser(users[1])
        houses[0].addUser(users[2])
        houses[0].addUser(users[3])
        houses[0].addUser(users[4])
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
            let backColor = UIColor(red:0.16, green:0.21, blue:0.28, alpha:1.0)
        
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let vc = nav.topViewController as! TasksTableViewController
            nav.navigationBar.barTintColor = backColor
            vc.delegate = self
            
            let nav1 = barViewControllers.viewControllers![1] as! UINavigationController
            let vc1 = nav1.topViewController as! HouseItemsTableViewController
            nav1.navigationBar.barTintColor = backColor
            vc1.delegate = self
            
            let nav2 = barViewControllers.viewControllers![2] as! UINavigationController
            let vc2 = nav2.topViewController as! StatsTableViewController
            nav2.navigationBar.barTintColor = backColor
            vc2.delegate = self
            
            let nav3 = barViewControllers.viewControllers![3] as! UINavigationController
            let vc3 = nav3.topViewController as! ProfileTableViewController
            nav3.navigationBar.barTintColor = backColor
            vc3.delegate = self
            
        }
    }
}

