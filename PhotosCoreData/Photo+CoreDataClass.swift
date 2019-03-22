//
//  Photo+CoreDataClass.swift
//  PhotosCoreData
//
//  Created by Zachary Pierucci on 3/21/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Photo)
public class Photo: NSManagedObject {
    
    var image : UIImage? {
        get {
            if let rawImage = rawImage {
                return UIImage(data: rawImage as Data)
            }
            return nil
        }
        set(value) {
            if let value = value {
                rawImage = (value.pngData()! as NSData)
            }
        }
    }
    
}
