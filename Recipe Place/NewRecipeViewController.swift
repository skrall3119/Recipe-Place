//
//  InstructionsViewController.swift
//  Recipe Place
//
//  Created by Alex Janci on 11/3/21.
//

import UIKit

class NewRecipeViewController: UIViewController{
    
    @IBAction func saveRecipe(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
