//
//  DetailViewControllerMain.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit

class DetailViewControllerMain: UIViewController {
    
    var detailData: Brand?
    var detailModelName: String = ""
    var brandName: String = ""
    var detailModelYear: String = ""
    var detailModelColors: String = ""
    var detailModelEngineType: String = ""
    var detailModelEnginePower: String = ""
    var detailModelDriveType: String = ""
    var detailModelGear: String = ""
    var detailModelDetailInfo: String = ""
    
    @IBOutlet weak var modelImage: UIImageView!
    @IBOutlet weak var modelNameTextField: UILabel!
    @IBOutlet weak var brandNameTextField: UILabel!
    @IBOutlet weak var modelYearTextField: UILabel!
    @IBOutlet weak var modelColorsTextField: UILabel!
    @IBOutlet weak var modelEngineTypeTextField: UILabel!
    @IBOutlet weak var modelEnginePowerTextField: UILabel!
    @IBOutlet weak var modelDriveTypeTextField: UILabel!
    @IBOutlet weak var modelGearTextField: UILabel!
    @IBOutlet weak var modelDetailInfoTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIImage(named: detailModelName) != nil {
            modelImage.image = UIImage(named: brandName)
        } else {
            modelImage.image = UIImage(named: "NoLogo")
        }
        
        modelNameTextField.text = detailModelName
        brandNameTextField.text = brandName
        modelYearTextField.text = detailModelYear
        modelColorsTextField.text = detailModelColors
        modelEngineTypeTextField.text = detailModelEngineType
        modelEnginePowerTextField.text = detailModelEnginePower
        modelDriveTypeTextField.text = detailModelDriveType
        modelGearTextField.text = detailModelGear
        modelDetailInfoTextField.text = detailModelDetailInfo
        
        modelNameTextField.layer.cornerRadius = 6
        modelNameTextField.layer.masksToBounds = true
        brandNameTextField.layer.cornerRadius = 6
        brandNameTextField.layer.masksToBounds = true
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
}


