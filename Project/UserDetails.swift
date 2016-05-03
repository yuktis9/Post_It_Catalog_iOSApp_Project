//
//  UserDetails.swift
//  Project
//
//  Created by yukti sarwadia on 5/2/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import Foundation
import RealmSwift

// userDetails model
class UserDetails: Object {
    dynamic var id = ""
    dynamic var userFirstName = ""
    dynamic var userLastName = ""
    dynamic var userEmail = ""
    dynamic var password = ""

    
        override static func primaryKey() -> String? {
            return "id"
        }

}

