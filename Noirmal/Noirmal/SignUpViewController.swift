//
//  SignUpViewController.swift
//  Noirmal
//
//  Created by Olamide Olatunji on 10/20/16.
//  Copyright © 2016 Olamide Olatunji. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var reenterPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        reenterPasswordTextField.layer.borderColor = UIColor.gray.cgColor
        
        // Do this for each UITextField
        nameTextField.delegate = self
        nameTextField.tag = 0 //Increment accordingly
        
        emailTextField.delegate = self
        emailTextField.tag = 1
        
        passwordTextField.delegate = self
        passwordTextField.tag = 2
        
        reenterPasswordTextField.delegate = self
        reenterPasswordTextField.tag = 3
     
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    
    
    
    @IBAction func createAccountButtonClicked(_ sender: AnyObject) {
        
        let usrEntered = nameTextField.text
        let pwdEntered = passwordTextField.text
        let emlEntered = emailTextField.text
        let pwdREEntered = reenterPasswordTextField.text
        
        if pwdEntered != pwdREEntered {
            
            let alert = UIAlertController(title: "Error", message:"Both password fields must match", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
            
        else { print("passwords the same") }
        
        if usrEntered == "" || pwdEntered == "" || emlEntered == "" || pwdREEntered == "" {
            
            let alert = UIAlertController(title: "Error", message:"All fields required", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        else { print("all fields complete") }
        
        
      userSignUp()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isToolbarHidden = true
    }
    
    
    func userSignUp() {
        let user = PFUser()
        user.username = nameTextField.text
        user.password = passwordTextField.text
        user.email = emailTextField.text
        // other fields can be set just like with PFObject
        user["Name"] = nameTextField.text
        
        
        user.signUpInBackground {
            (succeeded, errorr) -> Void in
            if let error = errorr {
                _ = ErrorUserInfoKey(rawValue: String())
                print(error, user)
            }
            else {
                print("WOOT")
            }
        }
    }
    
}


extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
