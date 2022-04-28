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
    
    var ingredients: [String:String] = [:]
    var instructions: [String] = []
    
    @IBAction func saveRecipe(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
        let recipeName = recipeName.text!
        
    }
    
    @IBAction func addIngredient(_ sender: Any) {
        let ingName = ingredientName.text!
        let ingAmt = ingredientAmount.text!
        
        ingredients[ingName] = ingAmt
        ingredientTableView.reloadData()
        
        ingredientName.text = ""
        ingredientAmount.text = ""
        
    }
    
    @IBAction func addInstruction(_ sender: Any) {
        let inst = instructionField.text!
        instructions.append(inst)
        instructionTableView.reloadData()
        
        instructionField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientTableView.delegate = self
        instructionTableView.delegate = self
        ingredientTableView.dataSource = self
        instructionTableView.dataSource = self
    }
}

extension NewRecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
    }
    
}

extension NewRecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == ingredientTableView){
            return ingredients.count
        } else if (tableView == instructionTableView){
            return instructions.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if (tableView == ingredientTableView){
            cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = Array(ingredients)[indexPath.row].key
            content.secondaryText = Array(ingredients)[indexPath.row].value
            cell.contentConfiguration = content
            return cell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = instructions[indexPath.row]
            cell.contentConfiguration = content
            return cell
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            if(tableView == ingredientTableView){
                ingredients.removeValue(forKey:(Array(ingredients)[indexPath.row].key))
                ingredientTableView.deleteRows(at: [indexPath], with: .fade)
            } else if (tableView == instructionTableView){
                instructions.remove(at: indexPath.row)
                instructionTableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        }
    }
}

struct Ingredient{
    var id: String
    var name: String
    var amount: Float
    var unit: String
    
    init(id: String, name: String, amount: Float, unit: String){
        self.id = id
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}
