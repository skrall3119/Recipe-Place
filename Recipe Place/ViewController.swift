//
//  ListViewController.swift
//  Recipe Place
//
//  Created by Alex Janci on 4/14/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        do { try Auth.auth().signOut() }
        catch { print("already logged out")}
        
        let storyboard = UIStoryboard(name: "Login", bundle: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        } else {return}
    }
}
    

