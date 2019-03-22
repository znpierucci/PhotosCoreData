//
//  Photo+CoreDataProperties.swift
//  PhotosCoreData
//
//  Created by Zachary Pierucci on 3/21/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var rawImage: NSData?

}
