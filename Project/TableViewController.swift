//
//  TableViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/18/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit
var toDoList = [String]()

class TableViewController: UITableViewController {
    
//    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableToDo: UITableView!
 //    @IBOutlet weak var tableView: UITableView!
    
    func tableToDo(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoList.count
    }
    
    
    func tableToDo(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .yellowColor();
        cell.selectedBackgroundView = backgroundView
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = .orangeColor();
        } else{
            cell.backgroundColor = .redColor();
        }
        
        return cell
    }
    
    // called when user will try to edit the item in the table i.e, swipe from the left
    
    func tableToDo(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            toDoList.removeAtIndex(indexPath.row)
            
            // updates both version of the array i.e, now one and saved one
            let default2 = NSUserDefaults.standardUserDefaults()
            default2.setObject(toDoList, forKey: "toDoList")
            
            //update table
            tableToDo.reloadData()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view, typically from a nib.
        
                if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil{
        
                    toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! NSArray as! [String]
                }
        
    }
    
   
    
    override func viewDidAppear(animated: Bool) {
                tableToDo.reloadData()
    }

       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

  


}
