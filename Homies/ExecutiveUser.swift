//
//  ExecutiveUser.swift
//  Homies
//
//  Created by Sam Khano on 4/18/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class ExecutiveUser: User {
    func addNewTask(newTask: Task) {
        userHouse.tasks.append(newTask)
    }
}
