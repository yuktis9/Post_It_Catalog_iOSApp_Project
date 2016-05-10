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
    
    @IBOutlet weak var signInButton: UIButton!
      // MARK: - Table view data source
    @IBOutlet weak var signUpButton: UIButton!

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
            
            let rightViewController = mainStoryboard.instantiateViewControllerWithIdentifier("AttachMediaViewController") as! AttachMediaViewController
            
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
        
        else
        
        {
            displayMyAlertMessage("Please enter valid login details!");
            
            return;
        }
    }
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signInButton.layer.cornerRadius = self.signInButton.frame.size.width / 2;
        self.signInButton.layer.borderWidth = 3;
        self.signInButton.layer.borderColor = UIColor.blackColor().CGColor;
        self.signInButton.clipsToBounds = true;
        
        self.signUpButton.layer.cornerRadius = self.signUpButton.frame.size.width / 2;
        self.signUpButton.layer.borderWidth = 3;
        self.signUpButton.layer.borderColor = UIColor.blackColor().CGColor;
        self.signUpButton.clipsToBounds = true;

//        
        
        
//        CGRect frameRect = userEmailTextField.frame;
//        frameRect.size.height = 100; // <-- Specify the height you want here.
//        textField.frame = frameRect;
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
