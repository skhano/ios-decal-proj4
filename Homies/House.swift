//
//  House.swift
//  Homies
//
//  Created by Sam Khano on 4/18/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else {
                print("continue: ")
                continue
            }
            swap(&self[i], &self[j])
            print("swapped list: ")
            for item in self{
                let curUser = item as? User
                print(curUser!.userName)
            }
        }
        
    }
}

class House: NSObject {
    var houseName : String!
    var exec : ExecutiveUser!
    var users : [User]!
    var originalUsers : [User]!
    var neededItems : [String]!
    var createdDate : NSDate!
    var tasks :[Task]!
    var monthTasks :[Task]!
    var updatedTasksDate: NSDate!

    init(eHouseName: String, eCreatedDate: NSDate) {
        houseName = eHouseName
        neededItems = []
        users = []
        originalUsers = []
        createdDate = eCreatedDate
        tasks = []
        monthTasks = []
        updatedTasksDate = NSDate(timeIntervalSinceNow: -30*24*3600)
    }
    
    func addUser(user : User) {
        users.append(user)
        originalUsers.append(user)
        if let houseUser = user as? ExecutiveUser {
            exec = houseUser
        }
    }
    
    func addTask(task: Task) {
        tasks.append(task)
        updateTasks()
    }

    func getLoserName() -> String {
        sortUsersScore()
        return users[users.count-1].userName
    }

    func sortUsersScore() {
        users.sortInPlace({$0.score > $1.score})
    }
    
    func getSortedUsers() -> [User] {
        sortUsersScore()
        return users
    }

    func getPurchasedItems() -> [String : Double] {
        var purchasedItems = [String : Double] ();
        for user in users {
            for (key, value) in (user.itemsBought) {
                purchasedItems[key] = value
            }
        }
        return purchasedItems
    }
    
    func getNeededItems() -> [String] {
        return neededItems
    }
    
    func shuffleUsers() {
        users = users.shuffle()
        print("shuffle: ")
        for user in users{
            print(user.userName)
        }
    }
    
    func clearUsersTasks() {
        for user in users {
            user.clearTasks()
        }
    }
    
    func updateTasks() {
        let oneMonthLaterDate = NSDate(timeIntervalSinceNow: 30*24*3600)
        for task in tasks {
            var dateComparisionResult = oneMonthLaterDate.compare(task.deadline)
            while dateComparisionResult == NSComparisonResult.OrderedDescending {
                monthTasks.append(task.copyTask())
                task.updateDeadline()
                dateComparisionResult = oneMonthLaterDate.compare(task.deadline)
            }
        }
        updatedTasksDate = NSDate()
        assignTasks()
        monthTasks.sortInPlace({($0.deadline).compare($1.deadline) == NSComparisonResult.OrderedAscending})
    }
    
    // Call this function everytime we log in
    func checkResetMonthTasks() {
        let oneMonthAgoDate = NSDate(timeIntervalSinceNow: -30*24*3600)
        let dateComparisionResult = oneMonthAgoDate.compare(updatedTasksDate)
        
        if dateComparisionResult == NSComparisonResult.OrderedDescending
        {
            updateTasks()
        }
    }
    
    func assignTasks() {
        checkResetMonthTasks()
        shuffleUsers()
        clearUsersTasks()
        var numUsers = users.count
        for task in monthTasks {
            if numUsers > 0 {
                numUsers = numUsers - 1
            } else {
                numUsers = users.count - 1
            }
            task.assignUser(users[numUsers])
            users[numUsers].addTask(task)
        }
    }
    
    func getMonthTasks() -> [Task] {
        return monthTasks
    }
    
    func getWeekTasks() -> [Task] {
        var weekTasks = [Task]()
        let oneWeekLaterDate = NSDate(timeIntervalSinceNow: 7*24*3600)
        for task in monthTasks {
            let dateComparisionResult = oneWeekLaterDate.compare(task.deadline)
            if dateComparisionResult == NSComparisonResult.OrderedDescending
            {
                weekTasks.append(task)
            }
        }
        for task in weekTasks {
            print(task.taskName)
        }
        return weekTasks
    }
}
