//
//  NewExpenseViewController.swift
//  Expenses
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit

class NewModelViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var modelNameTextField: UITextField!    
    @IBOutlet weak var modelYearTextField: UITextField!
    @IBOutlet weak var modelColorsTextField: UITextField!
    @IBOutlet weak var modelEngineTypeTextField: UITextField!
    @IBOutlet weak var modelEnginePowerTextField: UITextField!
    @IBOutlet weak var modelDriveTypeTextField: UITextField!
    @IBOutlet weak var modelGearTextField: UITextField!
    @IBOutlet weak var modelDetailInfoTextField: UITextView!
        
    var brand: Brand?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modelNameTextField.delegate = self
        modelYearTextField.delegate = self
        modelColorsTextField.delegate = self
        modelEngineTypeTextField.delegate = self
        modelEnginePowerTextField.delegate = self
        modelDriveTypeTextField.delegate = self
        modelGearTextField.delegate = self
        modelDetailInfoTextField.delegate = self
        
        modelNameTextField.layer.cornerRadius = 6
        modelNameTextField.layer.masksToBounds = true
        modelYearTextField.layer.cornerRadius = 6
        modelYearTextField.layer.masksToBounds = true
        modelColorsTextField.layer.cornerRadius = 6
        modelColorsTextField.layer.masksToBounds = true
        modelEngineTypeTextField.layer.cornerRadius = 6
        modelEngineTypeTextField.layer.masksToBounds = true
        modelEnginePowerTextField.layer.cornerRadius = 6
        modelEnginePowerTextField.layer.masksToBounds = true
        modelDriveTypeTextField.layer.cornerRadius = 6
        modelDriveTypeTextField.layer.masksToBounds = true
        modelGearTextField.layer.cornerRadius = 6
        modelGearTextField.layer.masksToBounds = true
        modelDetailInfoTextField.layer.cornerRadius = 6
        modelDetailInfoTextField.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        modelNameTextField.resignFirstResponder()
        modelYearTextField.resignFirstResponder()
        modelColorsTextField.resignFirstResponder()
        modelEngineTypeTextField.resignFirstResponder()
        modelEnginePowerTextField.resignFirstResponder()
        modelDriveTypeTextField.resignFirstResponder()
        modelGearTextField.resignFirstResponder()
        modelDetailInfoTextField.resignFirstResponder()
    }
    
    @IBAction func saveModel(_ sender: Any) {
        
        let modelName = modelNameTextField.text ?? "n/a"
        let modelYear = Int16(modelYearTextField.text ?? "n/a") ?? 0
        let modelColors = modelColorsTextField.text ?? "n/a"
        let modelEngineType = modelEngineTypeTextField.text ?? "n/a"
        let modelEnginePowerText = modelEnginePowerTextField.text ?? "n/a"
        let modelEnginePower = Double(modelEnginePowerText) ?? 0.0
        let modelDriveType = modelDriveTypeTextField.text ?? "n/a"
        let modelGear = modelGearTextField.text ?? "n/a"
        let modelDetailInfo = modelDetailInfoTextField.text ?? "n/a"
        
        if let model = Model(modelName: modelName, modelYear: modelYear, modelColors: modelColors, modelEngineType: modelEngineType, modelEnginePower: modelEnginePower, modelDriveType: modelDriveType, modelGear: modelGear, modelDetailInfo: modelDetailInfo) {
            brand?.addToBrandToModel(model)
            
            do {
               try model.managedObjectContext?.save()
                
                self.navigationController?.popViewController(animated: true)
                
                print("model created")
            } catch {
                print("model could not be created")
            }
        }
    }
}

extension NewModelViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
