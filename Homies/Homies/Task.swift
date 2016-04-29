//
//  Task.swift
//  Homies
//
//  Created by Sam Khano on 4/18/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class Task : NSObject {
    var taskName : String!
    var frequency : NSTimeInterval!
    var completed : Bool!
    var createdDate : NSDate!
    var completedDate : NSDate!
    var deadline: NSDate!
    var assignedUser: User!

    init(eTaskName : String, eFrequency : NSTimeInterval, eCreatedDate : NSDate, eDeadline : NSDate) {
        taskName = eTaskName
        frequency = eFrequency
        createdDate = eCreatedDate
        completedDate = nil
        completed = false
        assignedUser = nil
        deadline = eDeadline
    }

    func complete() {
        completed = true
        assignedUser.increScore()
        assignedUser.addCompletedTask(self)
        completedDate = NSDate()
    }
    
    func undo() {
        completed = false
        assignedUser.decScore()
        //assignedUser.removeCompletedTask(self)
    }
    
    func updateDeadline() {
        deadline = deadline.dateByAddingTimeInterval(frequency)
    }
    
    func assignUser(user: User) {
        assignedUser = user
    }
    
    func copyTask() -> Task {
        return Task.init(eTaskName: taskName, eFrequency: frequency, eCreatedDate: createdDate, eDeadline : deadline)
    }
}
