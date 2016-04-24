//
//  LoginViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/15/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        _ = appDelegate.window!.rootViewController
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let centerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        let leftViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LeftSideViewController") as! LeftSideViewController
        
        let rightViewController = mainStoryboard.instantiateViewControllerWithIdentifier("RightSideViewController") as! RightSideViewController
        
        let leftSideNav = UINavigationController(rootViewController: leftViewController)
        let centerNav = UINavigationController(rootViewController: centerViewController)
        let rightNav = UINavigationController(rootViewController: rightViewController)
        
        let centerContainer = MMDrawerController(centerViewController: centerNav, leftDrawerViewController: leftSideNav,rightDrawerViewController:rightNav)
        
        centerContainer.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView;
        centerContainer.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView;
        
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        appDelegate.centerContainer = centerContainer
        appDelegate.window!.rootViewController = appDelegate.centerContainer
        appDelegate.window!.makeKeyAndVisible()
        
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail")
        
        let userPasswordtored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword")
        
        
        if(userEmailStored == userEmail){
            if(userPasswordtored == userPassword){
                //Login is successfull
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
