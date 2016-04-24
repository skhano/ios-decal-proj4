//
//  House.swift
//  Homies
//
//  Created by Sam Khano on 4/18/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class House: NSObject {
    var houseName : String!
    var exec : ExecutiveUser!
    var users : [User]!
    var neededItems : [String]!
    var createdDate : NSDate!
    var tasks :[Task]!

    init(eHouseName: String, eCreatedDate: NSDate) {
        houseName = eHouseName
        createdDate = eCreatedDate
    }
    
    func addUser(user : User) {
        users.append(user)
        if let houseUser = user as? ExecutiveUser {
            exec = houseUser
        }
    }

    func getLoserName() -> String {
        sortUsersScore()
        return users[users.count-1].userName
    }

    func sortUsersScore() {
        users.sortInPlace({$0.score > $1.score})
    }

    func getPurchasedItems() -> NSMutableDictionary {
        let purchasedItems = NSMutableDictionary(dictionary: [String : Double] ());
        for user in users {
            purchasedItems.addEntriesFromDictionary(user.itemsBought)
        }
        return purchasedItems
    }
    func getNeededItems() -> [String] {
        return neededItems
    }
}
