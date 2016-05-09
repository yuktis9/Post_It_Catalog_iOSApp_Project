//
//  ViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/15/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit

//var toDoList = [String]()

class ViewController: UIViewController, UITableViewDelegate {

   // var manager: OneShotLocationManager?
    
    @IBOutlet weak var addMediaButton: UIButton!
    @IBOutlet weak var addLocationButton: UIButton!
    @IBOutlet weak var addReminderButton: UIButton!
    @IBOutlet weak var addTaskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addMediaButton.layer.cornerRadius = self.addMediaButton.frame.size.width / 2;
        self.addMediaButton.layer.borderWidth = 3;
        self.addMediaButton.layer.borderColor = UIColor.blackColor().CGColor;
        self.addMediaButton.clipsToBounds = true;

//        
        
        self.addLocationButton.layer.cornerRadius = self.addLocationButton.frame.size.width / 2;
        self.addLocationButton.layer.borderWidth = 3;
        self.addLocationButton.layer.borderColor = UIColor.blackColor().CGColor;
        self.addLocationButton.clipsToBounds = true;
//        
        self.addReminderButton.layer.cornerRadius = self.addReminderButton.frame.size.width / 2;
        self.addReminderButton.layer.borderWidth = 3;
        self.addReminderButton.layer.borderColor = UIColor.blackColor().CGColor;
        self.addReminderButton.clipsToBounds = true;
//        
        self.addTaskButton.layer.cornerRadius = self.addTaskButton.frame.size.width / 2;
        self.addTaskButton.layer.borderWidth = 3;
        self.addTaskButton.layer.borderColor = UIColor.blackColor().CGColor;
        self.addTaskButton.clipsToBounds = true;
        
    }

      
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
//        tableView.reloadData()
//        super.viewDidAppear(animated)
        
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        
        if(!isUserLoggedIn)
        {
            self.performSegueWithIdentifier("loginView", sender: self);
        }
        
        
    }


    @IBAction func leftSideButtonTapped(sender: AnyObject) {
        
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        
    }
    
    
    @IBAction func rightSideButtonTapped(sender: AnyObject) {
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Right, animated: true, completion: nil)
    }
    
   
    
}

