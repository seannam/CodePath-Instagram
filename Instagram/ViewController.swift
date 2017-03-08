//
//  ViewController.swift
//  Instagram
//
//  Created by Sean Nam on 3/7/17.
//  Copyright © 2017 Sean Nam. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginBUtton(_ sender: Any) {
    }

    @IBAction func onSignUpButton(_ sender: Any) {
        let newUser = PFUser()
        
        print(usernameTextField.text!)
        print(passwordTextField.text!)
        
//        let username = "snam@test.com"
//        let password = "123456789"
        
//        print(username)
//        print(password)
        
        newUser.username = usernameTextField.text!
        newUser.email = usernameTextField.text!
        newUser.password = passwordTextField.text!
        
//        newUser.username = username
//        newUser.email = username
//        newUser.password = password
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("[DEBUG] built user with email: \(newUser.email!)")
            } else{
                print("[DEBUG] failed to create user")
                print(error?.localizedDescription)
            }
        }
//        
//        newUser.signUpInBackground { (success: Bool, error: Error?) -> Void in
//            if success {
//                print("[DEBUG] built user with email: \(newUser.email!)")
//            } else {
//                print("[DEBUG] failed to create user")
//                print(error!.localizedDescription)
//            }
//        }
    }
}

