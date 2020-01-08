//
//  CameraAlert.swift
//  MultipleImage-TableViewCell-CameraCapture
//
//  Created by Shruthi Ramakrishnaiah on 4/12/19.
//  Copyright © 2019 Shruthi Ramakrishnaiah. All rights reserved.
//

import Foundation
import UIKit

class LMCameraAlert: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    static let sharedInstance = LMCameraAlert()
    let pickerView = UIImagePickerController()
    
    var onPhotoPicked:((UIImage)->Void)?
    
    //Show alert
    func alert(view: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let libraryAction = UIAlertAction(title: "Yes, from library", style: .default, handler: { action in
            self.libraryPictures(forView: view)
        })
        alert.addAction(libraryAction)
        let cameraAction = UIAlertAction(title: "Yes, from camera", style: .default, handler: { action in
            self.cameraPicture(forView: view)
        })
        alert.addAction(cameraAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { action in
        })
        alert.addAction(cancelAction)
        DispatchQueue.main.async(execute: {
            view.present(alert, animated: true)
        })
    }
    
    func libraryPictures(forView:UIViewController) {
        pickerView.delegate = self
        pickerView.sourceType = .photoLibrary
        forView.present(pickerView, animated: true, completion: nil)
    }
    
    func cameraPicture(forView:UIViewController) {
        pickerView.delegate = self
        pickerView.sourceType = .camera
        pickerView.cameraDevice = .rear
        pickerView.showsCameraControls = true
        forView.present(pickerView, animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let photo = info[.originalImage] as? UIImage {
            debugPrint(photo)
            onPhotoPicked?(photo)
        }
        pickerView.dismiss(animated: true, completion: nil)
    }
    
    private override init() {
    }
}
