//
//  Meal+CoreDataProperties.swift
//  PhotosCoreData
//
//  Created by Zachary Pierucci on 3/21/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var name: String?
    @NSManaged public var rawImage: NSData?
    @NSManaged public var carbs: String?
    @NSManaged public var protein: String?
    @NSManaged public var fat: String?
    @NSManaged public var calories: String?

}
