//
//  Model+CoreDataClass.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit
import CoreData

@objc(Model)
public class Model: NSManagedObject {
    convenience init?(modelName: String, modelYear: Int16, modelColors: String, modelEngineType: String, modelEnginePower: Double, modelDriveType: String, modelGear: String, modelDetailInfo: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else { return nil }
        
        self.init(entity: Model.entity(), insertInto: context)
        
        self.modelName = modelName
        self.modelYear = modelYear        
        self.modelColors = modelColors
        self.modelEngineType = modelEngineType
        self.modelEnginePower = modelEnginePower
        self.modelDriveType = modelDriveType
        self.modelGear = modelGear
        self.modelDetailInfo = modelDetailInfo
        
    }
}
