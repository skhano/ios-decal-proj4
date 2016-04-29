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
        itemsBought = [String : Double]()
        moneySpent = 0.0
    }
    
    init(enteredName : String, enteredPassword : String, enteredHouse : House) {
        score = 0
        tasks = []
        itemsBought = [String : Double]()
        moneySpent = 0.0
        userName = enteredName
        userPassword = enteredPassword
        userHouse = enteredHouse
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
    
    func calMoneySpent() -> Double {
        moneySpent = 0
        for (_,value) in itemsBought {
            moneySpent! += value
        }
        return moneySpent
    }
    
    func changeScore(val : Int) {
        score = score + val
    }
    
    func addWantedItem(wantedItem: String) {
        userHouse.neededItems.append(wantedItem)
    }
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
    }
    
    func clearTasks() {
        tasks.removeAll()
    }
    
    func clearBoughtItems() {
        itemsBought.removeAll()
    }

    func clearScore() {
        score = 0
    }
    
    func clearMoneySpent() {
        moneySpent = 0
    }
    
    func clearAll() {
        clearTasks()
        clearBoughtItems()
        clearScore()
        clearMoneySpent()
    }
    
    func increScore() {
        score = score + 2
    }
    
    func decScore() {
        score = score - 2
    }
}
