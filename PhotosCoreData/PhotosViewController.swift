//
//  PhotosViewController.swift
//  PhotosCoreData
//
//  Created by Zachary Pierucci on 3/21/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//

import UIKit
import CoreData

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var macrosLabel: UILabel!
    
    let imagePickerController = UIImagePickerController()
    
    //var images = [Photo]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerController.delegate = self
    }
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        fetchImage()
    }
 */
    
    @IBAction func openCamera(_ sender: Any) {
        takePhotoWithCamera()
    }
    
    @IBAction func openGallery(_ sender: Any) {
        selectPhotoFromLibrary()
    }
    
    func takePhotoWithCamera() {
        if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
            presentAlert(title: "No Camera", message: "This device has no camera.")
        } else {
            imagePickerController.allowsEditing = false
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func selectPhotoFromLibrary() {
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            let imageData = pickedImage.pngData() as NSData?
            if let data = imageData as Data? {
                imageView.image = UIImage(data:data)
            }
            
            appDelegate.saveContext()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    func fetchImage() {
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        
        do {
            images = try managedContext.fetch(fetchRequest)
        } catch {
            print("Fetch for image could not be performed.")
            return
        }
    }*/
}
