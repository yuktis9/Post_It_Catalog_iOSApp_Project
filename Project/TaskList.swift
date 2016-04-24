//
//  TaskList.swift
//  Project
//
//  Created by yukti sarwadia on 4/21/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import Foundation
import RealmSwift

class TaskList: Object{
   
//    dynamic var id = 0
    dynamic var name = ""
    dynamic var createdAt = NSDate()
    var tasks = List<Task>()
    
//    override static func primaryKey() -> String? {
//        return "id"
//    }
}