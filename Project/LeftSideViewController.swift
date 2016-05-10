//
//  LeftSideViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/15/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit

func getDocumentsURL() -> NSURL {
    let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    return documentsURL
}

func fileInDocumentsDirectory(filename: String) -> String {
    
    let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
    return fileURL.path!
    
}

class LeftSideViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
   // @IBOutlet weak var imageUploadProgressView: UIProgressView!
//    @IBOutlet weak var progressLabel: UILabel!
    
  //  @IBOutlet weak var scrollView: UIScrollView!
    
    var menuItems:[String] = ["Main","About", "Logout"];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For circular profile picture
        
//        self.myImageView.layer.cornerRadius = self.myImageView.frame.size.width / 2;
//        self.myImageView.layer.borderWidth = 3;
//        self.myImageView.layer.borderColor = UIColor.blackColor().CGColor;
//        self.myImageView.clipsToBounds = true;
        
        
        // Do any additional setup after loading the view.
        
        self.uploadButton.layer.cornerRadius = self.uploadButton.frame.size.width / 2;
        self.uploadButton.layer.borderWidth = 3;
        self.uploadButton.layer.borderColor = UIColor.blackColor().CGColor;
        self.uploadButton.clipsToBounds = true;
        
        // Define the specific path, image name
        let myImageName = "image.png"
        let imagePath = fileInDocumentsDirectory(myImageName)
        
        if let loadedImage = loadImageFromPath(imagePath) {
            print(" Loaded Image: \(loadedImage)")
            myImageView.image = loadedImage
        } else { print("some error message 2") }
        
    }
    
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
        
        // Define the specific path, image name
        let myImageName = "image.png"
        let imagePath = fileInDocumentsDirectory(myImageName)
        
        if let image = myImageView.image {
            saveImage(image, path: imagePath)
        } else { print("some error message") }
        
        if let loadedImage = loadImageFromPath(imagePath) {
            print(" Loaded Image: \(loadedImage)")
        } else { print("some error message 2") }
    }
    
    func saveImage (image: UIImage, path: String ) -> Bool{
        
        let pngImageData = UIImagePNGRepresentation(image)
        //let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = pngImageData!.writeToFile(path, atomically: true)
        
        return result
        
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}