//
//  Task.swift
//  Project
//
//  Created by yukti sarwadia on 4/21/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
//    dynamic var id = 0
//    dynamic var title = ""
//    dynamic var desc = ""
//    dynamic var date = NSDate()
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var createdAt = NSDate()
    dynamic var notes = ""
    dynamic var isCompleted = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}