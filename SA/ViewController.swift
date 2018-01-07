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
        if emailText.text != "" && passwordText.text != ""{
            if segmentControl.selectedSegmentIndex == 0 // login user
            {
                Auth.auth().signIn(withEmail : emailText.text! , password : passwordText.text! , completion : { (user , error) in
                    if user != nil
                    {
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("Error")
                        }
                    }
                })
            }
            else // Sing up user
            {
                Auth.auth().createUser(withEmail : emailText.text! , password : passwordText.text! , completion : { (user , error) in
                    if user != nil
                    {
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("Error")
                        }
                    }
                })
            }
        }
    }
    
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Welcome to Travelers", message: "準備好了嗎？", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "開始旅程", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
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

