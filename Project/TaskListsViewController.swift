//
//  TaskListsViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/21/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//


import UIKit
import RealmSwift

class TaskListsViewController: UIViewController, UITableViewDelegate{

    
    var lists : Results<TaskList>!
    var isEditingMode = false
    var currentCreateAction:UIAlertAction!

    @IBOutlet weak var taskListsTableView: UITableView!
    
    
    
    @IBAction func didSelectSortCriteria(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0{
            
            // A-Z
            self.lists = self.lists.sorted("name")
        }
        else{
            // date
            self.lists = self.lists.sorted("createdAt", ascending:false)
        }
        self.taskListsTableView.reloadData()
    }
    
    func readTasksAndUpdateUI(){
        
        lists = uiRealm.objects(TaskList)
        self.taskListsTableView.setEditing(false, animated: true)
        self.taskListsTableView.reloadData()
    }
    
    
    @IBAction func didClickOnAddButton(sender: AnyObject) {
        
        displayAlertToAddTaskList(nil)
    }
    
    func displayAlertToAddTaskList(updatedList:TaskList!){
        var title = "New Tasks List"
        var doneTitle = "Create"
        if updatedList != nil{
            title = "Update Tasks List"
            doneTitle = "Update"
        }
        
        let alertController = UIAlertController(title: title, message: "Write the name of your tasks list.", preferredStyle: UIAlertControllerStyle.Alert)
        let createAction = UIAlertAction(title: doneTitle, style: UIAlertActionStyle.Default) { (action) -> Void in
            
            let listName = alertController.textFields?.first?.text
            
            if updatedList != nil{
                // update mode
                do{
                
                try uiRealm.write({ () -> Void in
                    updatedList.name = listName!
                    self.readTasksAndUpdateUI()
                })}
                catch{
                    print("Error in realm connection!")
                }
            }
            else{
                
                let newTaskList = TaskList()
                newTaskList.name = listName!
                
                do{
                    
                    try uiRealm.write({ () -> Void in
                    
                    uiRealm.add(newTaskList)
                    self.readTasksAndUpdateUI()
                })}
                catch{
                    print("Error in realm connection!")
                }
            }
            
            
            
            print(listName)
        }
        
        alertController.addAction(createAction)
        createAction.enabled = false
        self.currentCreateAction = createAction
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Task List Name"
            textField.addTarget(self, action: #selector(TaskListsViewController.listNameFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
            if updatedList != nil{
                textField.text = updatedList.name
            }
        }
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }    //Enable the create action of the alert only if textfield text is not empty
    func listNameFieldDidChange(textField:UITextField){
        self.currentCreateAction.enabled = textField.text?.characters.count > 0
        }
    
    @IBAction func didClickOnEditButton(sender: AnyObject) {
        isEditingMode = !isEditingMode
        self.taskListsTableView.setEditing(isEditingMode, animated: true)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let listsTasks = lists{
            return listsTasks.count
        }
        return 0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let tasksViewController = segue.destinationViewController as! TasksViewController
        tasksViewController.selectedList = sender as! TaskList
}
}

