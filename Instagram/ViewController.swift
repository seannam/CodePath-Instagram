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

        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("[DEBUG] User \(username) login failed!")
            } else {
                print("[DEBUG] User \(username) login success!")
                
                self.segueToHome()
            }
        }

    }

    @IBAction func onSignUpButton(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameTextField.text!
        newUser.email = usernameTextField.text!
        newUser.password = passwordTextField.text!
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            // if error == nil{
            if success {
                print("[DEBUG] built user with email: \(newUser.email!)")
                
                self.segueToHome()
            } else{
                print("[DEBUG] failed to create user")
                print(error?.localizedDescription)
            }
        }

    }
    
    func segueToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController")

        let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
//        let homeVC = tabBarController.childViewControllers.first as! HomeViewController

        self.present(tabBarController, animated: true, completion: nil)
    }
}

