//
//  Meal+CoreDataClass.swift
//  PhotosCoreData
//
//  Created by Zachary Pierucci on 3/21/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Meal)
public class Meal: NSManagedObject {
    
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
    
//    convenience init?(name: String?, calories: String?, carbs: String?, protein: String?, fat: String?) {
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate  //UIKit is needed to access UIApplication
//        guard let managedContext = appDelegate?.persistentContainer.viewContext,
//            let name = name, name != "" else {
//                return nil
//        }
//        self.init(entity: Meal.entity(), insertInto: managedContext)
//        self.name = name
//        self.calories = calories
//        self.carbs = carbs
//        self.protein = protein
//        self.fat = fat
//
//        //self.image =
//    }
    
}
