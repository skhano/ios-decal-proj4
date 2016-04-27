//
//  RegisterHouseViewController.swift
//  Homies
//
//  Created by Sam Khano on 4/18/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class RegisterHouseViewController: UIViewController {

    @IBOutlet weak var enteredHouseName: UITextField!
    @IBOutlet weak var enteredHouseExecutive: UITextField!
    @IBOutlet weak var enteredPassword: UITextField!
    
    var users : [User]!
    var houses : [House]!
    var currentUser : User!
    var defaults : NSUserDefaults!
    
    @IBAction func registerButton(sender: AnyObject) {
        houses = [House.init(eHouseName: "berkeleyhome", eCreatedDate: NSDate())]
        users = [ExecutiveUser.init(enteredName: "eva", enteredPassword: "eva", enteredHouse: houses[0]), User.init(enteredName: "sam", enteredPassword: "sam", enteredHouse: houses[0]), User.init(enteredName: "mike", enteredPassword: "mike", enteredHouse: houses[0]), User.init(enteredName: "jane", enteredPassword: "jane", enteredHouse: houses[0]), User.init(enteredName: "bob", enteredPassword: "bob", enteredHouse: houses[0])]
        houses[0].addUser(users[0])
        houses[0].addUser(users[1])
        houses[0].addUser(users[2])
        houses[0].addUser(users[3])
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(houses[0], forKey: "berkeleyhome")
        defaults.setObject(users[0], forKey: "berkeleyhome-eva")
        defaults.setObject(users[0], forKey: "berkeleyhome-sam")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
