//
//  AddTaskViewController.swift
//  Homies
//
//  Created by Eva on 4/24/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskText: UITextField!
    
    @IBOutlet weak var repeatInDays: UITextField!
    
    @IBOutlet weak var deadlineInDays: UITextField!
    
    var delegate : LoginDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        if let _ = delegate?.getCurrentUser() as? ExecutiveUser {
            delegate?.getCurrentUser().userHouse.addTask(Task.init(eTaskName: taskText.text!, eFrequency:
            (repeatInDays.text! as NSString).doubleValue*24*3600, eCreatedDate: NSDate(),
            eDeadline: NSDate(timeIntervalSinceNow: NSTimeInterval((deadlineInDays.text! as NSString).doubleValue)*24*3600)))
        }
    }
    
    
    
    
}