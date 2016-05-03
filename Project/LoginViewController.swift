//
//  LoginViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/15/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
      // MARK: - Table view data source

    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        if userEmailStored == userEmail && userPasswordStored == userPassword
        {
            
            // Login is successfull
            NSUserDefaults.standardUserDefaults().setBool(true,forKey:"isUserLoggedIn");
            NSUserDefaults.standardUserDefaults().synchronize();
                
            self.dismissViewControllerAnimated(true, completion:nil);
            
            
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
        }
    }

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
    

}
