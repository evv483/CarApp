//
//  NewCategoryViewController.swift
//  ExpensesCoreData
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit

class NewBrandViewController: UIViewController {

    @IBOutlet weak var brandNameTextField: UITextField!
    @IBOutlet weak var brandYearTextField: UITextField!    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        brandNameTextField.delegate = self
        brandYearTextField.delegate = self
        
        brandNameTextField.layer.cornerRadius = 6
        brandNameTextField.layer.masksToBounds = true
        brandYearTextField.layer.cornerRadius = 6
        brandYearTextField.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        brandNameTextField.resignFirstResponder()
        brandYearTextField.resignFirstResponder()
    }
    
    @IBAction func saveBrand(_ sender: Any) {
        let brand = Brand(brandName: brandNameTextField.text ?? "n/a", brandYear: Int16(brandYearTextField.text ?? "n/a") ?? 0)
        
        do {
            try brand?.managedObjectContext?.save()
            
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Could not save brand")
        }   
    }
}

extension NewBrandViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
