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

typealias FIRUser = FirebaseAuth.User

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        guard let authUI = FUIAuth.defaultAuthUI() else {
            return
        }
        
        authUI.delegate = self
        
        let providers: [FUIAuthProvider] = [FUIEmailAuth()]
        authUI.providers = providers
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}
extension SignInViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?){
        if let error = error {
            assertionFailure("Error Signing in: \(error.localizedDescription)")
            return
        }
        
        
        guard let user = authDataResult?.user
        else {return}
        
        print(user)
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                User.setCurrent(user)
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                print("Do something if cant login")
            }
        }
    }
}
