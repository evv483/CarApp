//
//  Brand+CoreDataClass.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit
import CoreData

@objc(Brand)
public class Brand: NSManagedObject {
    var models: [Model]? {
        return self.brandToModel?.array as? [Model]
    }
    
    convenience init?(brandName: String, brandYear: Int16) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else { return nil }
        
        self.init(entity: Brand.entity(), insertInto: context)
        
        self.brandName = brandName
        
        self.brandYear = brandYear
    }
}
