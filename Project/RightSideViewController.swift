//
//  RightSideViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/15/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit

class RightSideViewController: UIViewController {
  
    @IBOutlet weak var txtAddItem: UITextField!
    @IBOutlet weak var tblShoppingList: UITableView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var shoppingList: NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.tblShoppingList.delegate = self
//        self.tblShoppingList.dataSource = self
//        
//        self.txtAddItem.delegate = self
//        
//        datePicker.hidden = true
//        
//        loadShoppingList()
//        
//        setupNotificationSettings()
//        
//        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RightSideViewController.handleModifyListNotification), name: "modifyListNotification", object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RightSideViewController.handleDeleteListNotification), name: "deleteListNotification", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: IBAction method implementation
    
//    @IBAction func scheduleReminder(sender: AnyObject) {
//        if datePicker.hidden {
//            animateMyViews(tblShoppingList, viewToShow: datePicker)
//            
//            UIApplication.sharedApplication().cancelAllLocalNotifications()
//        }
//        else{
//            animateMyViews(datePicker, viewToShow: tblShoppingList)
//            
//            scheduleLocalNotification()
//        }
//        
//        txtAddItem.enabled = !txtAddItem.enabled
//    }
//    
//    
//    
//    func setupNotificationSettings() {
//        let notificationSettings: UIUserNotificationSettings! = UIApplication.sharedApplication().currentUserNotificationSettings()
//        
//        if (notificationSettings.types == UIUserNotificationType.None){
//            // Specify the notification types.
//            let notificationTypes: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Sound]
//            
//            
//            // Specify the notification actions.
//            let justInformAction = UIMutableUserNotificationAction()
//            justInformAction.identifier = "justInform"
//            justInformAction.title = "OK, got it"
//            justInformAction.activationMode = UIUserNotificationActivationMode.Background
//            justInformAction.destructive = false
//            justInformAction.authenticationRequired = false
//            
//            let modifyListAction = UIMutableUserNotificationAction()
//            modifyListAction.identifier = "editList"
//            modifyListAction.title = "Edit list"
//            modifyListAction.activationMode = UIUserNotificationActivationMode.Foreground
//            modifyListAction.destructive = false
//            modifyListAction.authenticationRequired = true
//            
//            let trashAction = UIMutableUserNotificationAction()
//            trashAction.identifier = "trashAction"
//            trashAction.title = "Delete list"
//            trashAction.activationMode = UIUserNotificationActivationMode.Background
//            trashAction.destructive = true
//            trashAction.authenticationRequired = true
//            
//            let actionsArray = NSArray(objects: justInformAction, modifyListAction, trashAction)
//            let actionsArrayMinimal = NSArray(objects: trashAction, modifyListAction)
//            
//            // Specify the category related to the above actions.
//            let shoppingListReminderCategory = UIMutableUserNotificationCategory()
//            shoppingListReminderCategory.identifier = "shoppingListReminderCategory"
//            shoppingListReminderCategory.setActions(actionsArray as? [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Default)
//            shoppingListReminderCategory.setActions(actionsArrayMinimal as? [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Minimal)
//            
//            
//            let categoriesForSettings = NSSet(objects: shoppingListReminderCategory)
//            
//            
//            // Register the notification settings.
//            let newNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: categoriesForSettings as? Set<UIUserNotificationCategory>)
//            UIApplication.sharedApplication().registerUserNotificationSettings(newNotificationSettings)
//        }
//    }
//    
//    
//    func scheduleLocalNotification() {
//        let localNotification = UILocalNotification()
//        localNotification.fireDate = fixNotificationDate(datePicker.date)
//        localNotification.alertBody = "Hey, you must go shopping, remember?"
//        localNotification.alertAction = "View List"
//        
//        localNotification.category = "shoppingListReminderCategory"
//        
//        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
//    }
//    
//    
//    func fixNotificationDate(dateToFix: NSDate) -> NSDate {
//        let dateComponets: NSDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.NSDayCalendarUnit, NSCalendarUnit.NSMonthCalendarUnit, NSCalendarUnit.NSYearCalendarUnit, NSCalendarUnit.NSHourCalendarUnit, NSCalendarUnit.NSMinuteCalendarUnit], fromDate: dateToFix)
//        
//        dateComponets.second = 0
//        
//        let fixedDate: NSDate! = NSCalendar.currentCalendar().dateFromComponents(dateComponets)
//        
//        return fixedDate
//    }
//    
//    
//    func handleModifyListNotification() {
//        txtAddItem.becomeFirstResponder()
//    }
//    
//    
//    func handleDeleteListNotification() {
//        shoppingList.removeAllObjects()
//        saveShoppingList()
//        tblShoppingList.reloadData()
//    }
//    
//    
//    // MARK: Method implementation
//    
//    func removeItemAtIndex(index: Int) {
//        shoppingList.removeObjectAtIndex(index)
//        
//        tblShoppingList.reloadData()
//        
//        saveShoppingList()
//    }
//    
//    
//    func saveShoppingList() {
//        let pathsArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
//        let documentsDirectory = pathsArray[0] as String
//        //        let savePath = documentsDirectory.stringByAppendingPathComponent("shopping_list")
//        let savePath =  NSURL(fileURLWithPath: documentsDirectory).URLByAppendingPathComponent("shopping_list")
//        let urlString = savePath.absoluteString
//        shoppingList.writeToFile(urlString, atomically: true)
//    }
//    
//    
//    func loadShoppingList() {
//        let pathsArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
//        let documentsDirectory = pathsArray[0] as String
//        // let shoppingListPath = documentsDirectory.stringByAppendingPathComponent("shopping_list")
//        let shoppingListPath =  NSURL(fileURLWithPath: documentsDirectory).URLByAppendingPathComponent("shopping_list")
//        let urlString = shoppingListPath.absoluteString
//        
//        if NSFileManager.defaultManager().fileExistsAtPath(urlString){
//            shoppingList = NSMutableArray(contentsOfFile: urlString)
//            tblShoppingList.reloadData()
//        }
//    }
//    
//    
//    func animateMyViews(viewToHide: UIView, viewToShow: UIView) {
//        let animationDuration = 0.35
//        
//        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
//            viewToHide.transform = CGAffineTransformScale(viewToHide.transform, 0.001, 0.001)
//        }) { (completion) -> Void in
//            
//            viewToHide.hidden = true
//            viewToShow.hidden = false
//            
//            viewToShow.transform = CGAffineTransformScale(viewToShow.transform, 0.001, 0.001)
//            
//            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
//                viewToShow.transform = CGAffineTransformIdentity
//            })
//        }
//    }
//    
//    
//    // MARK: UITableView method implementation
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var rows = 0
//        
//        if let list = shoppingList{
//            rows = list.count
//        }
//        
//        return rows
//    }
//    
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCellWithIdentifier("idCellItem")! as UITableViewCell
//        
//        cell.textLabel?.text = shoppingList.objectAtIndex(indexPath.row) as! NSString as String
//        
//        return cell
//    }
//    
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 50.0
//    }
//    
//    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            removeItemAtIndex(indexPath.row)
//        }
//    }
//    
//    
//    
//    // MARK: UITextFieldDelegate method implementation
//    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        if shoppingList == nil{
//            shoppingList = NSMutableArray()
//        }
//        shoppingList.addObject(textField.text!)
//        
//        tblShoppingList.reloadData()
//        
//        txtAddItem.text = ""
//        txtAddItem.resignFirstResponder()
//        
//        saveShoppingList()
//        
//        return true
//    }
    
}

