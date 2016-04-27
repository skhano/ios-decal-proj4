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
    var frequency : String!
    var startOffset : Int!
    var completed : Bool!
    var CreatedDate : NSDate!

    init(eTaskName : String, eFrequency : String, eCreatedDate : NSDate, eStartOffset : Int) {
        taskName = eTaskName
        frequency = eFrequency
        startOffset = eStartOffset
        CreatedDate = eCreatedDate
        completed = false
    }
}
