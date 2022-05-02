//
//  SignInViewController.swift
//  Recipe Place
//
//  Created by Alex Janci on 4/16/22.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase


class SignInViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
    }
    
    func validateFields() -> String? {
        if emailText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please Fill In All Fields"
        }
        
        return nil
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            self.errorLabel.text = error
            self.errorLabel.alpha = 1
        } else {
            let email = emailText.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                password = passwordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil{
                    self.errorLabel.alpha = 1
                    self.errorLabel.text = error!.localizedDescription
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: .main)
                    if let initialViewController = storyboard.instantiateInitialViewController() {
                        self.view.window?.rootViewController = initialViewController
                        self.view.window?.makeKeyAndVisible()
                    }
                }
            }
        }
    }
}
