//
//  UserProfile.swift
//  Homies
//
//  Created by Sam Khano on 4/18/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class User : NSObject {
    var userName : String!
    var userPassword : String!
    var userHouse : House!
    
    var score : Int!
    var tasks : [Task]!
    var itemsBought : [String : Double]
    var moneySpent : Double!
    
    override init () {
        score = 0
        tasks = []
        moneySpent = 0.0
    }
    
    init(enteredName : String, enteredPassword : String, enteredHouse : House) {
        super.init()
        score = 0
        tasks = []
        moneySpent = 0
        userName = enteredName
        userPassword = enteredPassword
        userHouse = enteredHouse
       // tasks = enteredTasks
        itemsBought = [String : Double]()
    }
    
    func boughtItem(item : String, cost : Double) {
        if (userHouse.neededItems.contains(item)) {
            var index = 0
            for elem in userHouse.neededItems {
                if elem == item {
                    userHouse.neededItems.removeAtIndex(index)
                    break
                } else {
                    index = index + 1
                }
            }
        }
        itemsBought[item] = cost
        moneySpent = moneySpent + cost
        score = score + 1
    }
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
    }
    
    func clearTasks() {
        tasks.removeAll()
    }
    
    func addWantedItem(wantedItem: String) {
        userHouse.neededItems.append(wantedItem)
    }
    
}
