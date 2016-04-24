////
////  AddTaskViewController.swift
////  Project
////
////  Created by yukti sarwadia on 4/18/16.
////  Copyright © 2016 yukti sarwadia. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//
//class AddTaskViewController: UIViewController  {
//
//    @IBOutlet weak var userAddTitle: UITextField!
//    @IBOutlet weak var userAddDesc: UITextField!
//    
//    @IBAction func addItem(sender: AnyObject) {
//        toDoList.append(userAddTitle.text!)
//        userAddTitle.text = ""
//        
//        let task = Task()
//        task.title = userAddTitle.text!
//        task.desc = userAddDesc.text!
//        
//        let realm = try! Realm()
//        try! realm.write() {
//            realm.add(task)
//        }
////        toDoList.append(userAddDesc.text!)
////        userAddDesc.text = ""
//        
//        //set the object value to toDoList and update the toDoList array
//        
//        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
//        
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    
////    func textFieldShouldReturn(textField: UITextField ) -> Bool{
////        userAddTitle.resignFirstResponder()
//////        userAddDesc.resignFirstResponder()
////        return true
////    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//}
