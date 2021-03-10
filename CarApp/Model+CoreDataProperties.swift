//
//  Model+CoreDataProperties.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import Foundation
import CoreData


extension Model {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Model> {
        return NSFetchRequest<Model>(entityName: "Model")
    }

    @NSManaged public var modelEnginePower: Double
    @NSManaged public var modelName: String?
    @NSManaged public var modelYear: Int16
    @NSManaged public var modelColors: String?
    @NSManaged public var modelEngineType: String?
    @NSManaged public var modelDriveType: String?
    @NSManaged public var modelGear: String?
    @NSManaged public var modelDetailInfo: String?
    @NSManaged public var modelToBrand: Brand?

}
