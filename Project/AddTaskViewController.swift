//
//  AddTaskViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/18/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController  {

    @IBOutlet weak var userAddTitle: UITextField!
    @IBOutlet weak var userAddDesc: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        toDoList.append(userAddTitle.text!)
        userAddTitle.text = ""
        
//        toDoList.append(userAddDesc.text!)
//        userAddDesc.text = ""
        
        //set the object value to toDoList and update the toDoList array
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//    func textFieldShouldReturn(textField: UITextField ) -> Bool{
//        userAddTitle.resignFirstResponder()
////        userAddDesc.resignFirstResponder()
//        return true
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
