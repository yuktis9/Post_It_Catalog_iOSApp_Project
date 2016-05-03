//
//  RegisterViewController.swift
//  Project
//
//  Created by yukti sarwadia on 4/16/16.
//  Copyright © 2016 yukti sarwadia. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController, UINavigationControllerDelegate  {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!

    
    func adduserDetails(){
        
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = userRepeatPasswordTextField.text;
        let userLastName = userLastNameTextField.text;
        let userFirstNameEntered = userFirstNameTextField.text;
        
        
        //Check for Empty fields
        if(userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty || userLastName!.isEmpty || userFirstNameEntered!.isEmpty)
        {
            
            displayMyAlertMessage("All fields are required");
            
            return;
            
        }
        
        //Checks if passwords match
        if (userPassword != userRepeatPassword)
        {
            
            displayMyAlertMessage("Passwords mismatch");
            
            return;
            
        }
        
        //Store data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize();
        
        //Display alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successfull!", preferredStyle: UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){ action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        //Adding action to viewController
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize.height = 1000
        scrollView.contentSize.width = 1000
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func iHaveAnAccount(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
