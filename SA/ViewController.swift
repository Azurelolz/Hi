//
//  ViewController.swift
//  SA
//
//  Created by 輔仁大學 on 2017/12/30.
//  Copyright © 2017年 Seafood. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func action(_ sender: UIButton) {
        if emailText.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        if emailText.text != "" && passwordText.text != ""{
            if segmentControl.selectedSegmentIndex == 0 // login user
            {
                Auth.auth().signIn(withEmail : emailText.text! , password : passwordText.text! , completion : { (user , error) in
                    if error == nil {
                        
                        // 登入成功，打印 ("You have successfully logged in")
                        
                        //Go to the HomeViewController if the login is sucessful
                       self.performSegue(withIdentifier: "segue", sender: self)
                        /*let vc = self.storyboard?.instantiateViewController(withIdentifier: "segue")
                        self.present(vc!, animated: true, completion: nil)*/
                        
                    } else {
                        
                        // 提示用戶從 firebase 返回了一個錯誤。
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                })
            }
            else // Sing up user
            {
                Auth.auth().createUser(withEmail : emailText.text! , password : passwordText.text! , completion : { (user , error) in
                    if error == nil {
                        print("You have successfully signed up")
                        //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                        
                        self.performSegue(withIdentifier: "segue", sender: self)
                        /*let vc = self.storyboard?.instantiateViewController(withIdentifier: "segue")
                        self.present(vc!, animated: true, completion: nil)*/
                        
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                })
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

