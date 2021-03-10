//
//  Brand+CoreDataProperties.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import Foundation
import CoreData


extension Brand {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Brand> {
        return NSFetchRequest<Brand>(entityName: "Brand")
    }

    @NSManaged public var brandName: String?
    @NSManaged public var brandYear: Int16
    @NSManaged public var brandToModel: NSOrderedSet?

}

// MARK: Generated accessors for brandToModel
extension Brand {

    @objc(insertObject:inBrandToModelAtIndex:)
    @NSManaged public func insertIntoBrandToModel(_ value: Model, at idx: Int)

    @objc(removeObjectFromBrandToModelAtIndex:)
    @NSManaged public func removeFromBrandToModel(at idx: Int)

    @objc(insertBrandToModel:atIndexes:)
    @NSManaged public func insertIntoBrandToModel(_ values: [Model], at indexes: NSIndexSet)

    @objc(removeBrandToModelAtIndexes:)
    @NSManaged public func removeFromBrandToModel(at indexes: NSIndexSet)

    @objc(replaceObjectInBrandToModelAtIndex:withObject:)
    @NSManaged public func replaceBrandToModel(at idx: Int, with value: Model)

    @objc(replaceBrandToModelAtIndexes:withBrandToModel:)
    @NSManaged public func replaceBrandToModel(at indexes: NSIndexSet, with values: [Model])

    @objc(addBrandToModelObject:)
    @NSManaged public func addToBrandToModel(_ value: Model)

    @objc(removeBrandToModelObject:)
    @NSManaged public func removeFromBrandToModel(_ value: Model)

    @objc(addBrandToModel:)
    @NSManaged public func addToBrandToModel(_ values: NSOrderedSet)

    @objc(removeBrandToModel:)
    @NSManaged public func removeFromBrandToModel(_ values: NSOrderedSet)

}
