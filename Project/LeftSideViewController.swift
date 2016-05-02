//
//  LeftSideViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/15/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
   // @IBOutlet weak var imageUploadProgressView: UIProgressView!
//    @IBOutlet weak var progressLabel: UILabel!
    
  //  @IBOutlet weak var scrollView: UIScrollView!
    
    var menuItems:[String] = ["Main","About", "Logout"];
    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(myPickerController, animated: true, completion: nil)
//        let documentsPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
//        let documentsPath = documentsPaths.first
//        
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("image selected from the lib")
        self.dismissViewControllerAnimated(true, completion: nil)
        myImageView.image = image
    }
    
   
//        
//    myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        myImageView.backgroundColor = UIColor.clearColor()
//        self.dismissViewControllerAnimated(true, completion: nil)
//        
//        uploadImage()
//    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count;
        
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        
    {
//        let mycell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) 
    
    let mycell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCustomTableViewCell
    
        mycell.menuItemLabel.text = menuItems[indexPath.row]
        
        
        return mycell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        switch(indexPath.row)
        {
            
        case 0:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            
            let centerNavController = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = centerNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            
            break;
            
        case 1:
            
            let aboutViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AboutViewController") as! AboutViewController
            
            let aboutNavController = UINavigationController(rootViewController: aboutViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = aboutNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            
            break;
            
        case 2:
            
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            let loginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = loginViewController
            
           // let aboutNavController = UINavigationController(rootViewController: LoginViewController)
            
           // let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
//            appDelegate.centerContainer!.centerViewController = aboutNavController
//            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            
            break;
            
        default:
            
            print("\(menuItems[indexPath.row]) is selected");
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}