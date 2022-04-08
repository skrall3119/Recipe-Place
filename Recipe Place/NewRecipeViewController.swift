//
//  InstructionsViewController.swift
//  Recipe Place
//
//  Created by Alex Janci on 11/3/21.
//

import UIKit

class NewRecipeViewController: UIViewController{
    
    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var ingredientName: UITextField!
    @IBOutlet weak var ingredientAmount: UITextField!
    @IBOutlet weak var instructionField: UITextField!
    
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var instructionTableView: UITableView!
    
    @IBAction func saveRecipe(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func addIngredient(_ sender: Any) {
        
    }
    
    @IBAction func addInstruction(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

struct Ingredient{
    var name: String
    var amount: Float
    var unit: String
    
    init(name: String, amount: Float, unit: String){
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}
