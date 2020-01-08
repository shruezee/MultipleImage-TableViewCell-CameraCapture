//
//  ViewController.swift
//  MultipleImage-TableViewCell-CameraCapture
//
//  Created by Shruthi Ramakrishnaiah on 3/12/19.
//  Copyright © 2019 Shruthi Ramakrishnaiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    struct ImageStruct {
        var Id: Int
        var images: [UIImage?]
    }
    
    @IBOutlet weak var cameraTable:UITableView!
    var imagePicker = UIImagePickerController()
    var imageCells = [ImageStruct]()
    var lastSelectedIndex: IndexPath?
    
    let imageSize:CGFloat = 50
    let imagePadding:CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<50 {
            let entry = ImageStruct(Id: i, images: [])
            imageCells.append(entry)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageCells.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Sample", for: indexPath as IndexPath) as? SampleTableViewCell {
            cell.cellTitle.text = "\(indexPath.row)"
            
            cell.addImagePressed = { superStackView in
                       if self.imageCells[indexPath.row].images.count < 5 {
                           self.callCellImagePicker(forCell: indexPath, cell: cell, stackView: superStackView)
                       }
                       else if self.imageCells[indexPath.row].images.count == 5 {
                           let alert = UIAlertController(title: "Maximum images added", message: "", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                               //
                           }))
                           self.present(alert, animated: true, completion: nil)
                       }
                   }
            
            return cell
        }
        return UITableViewCell(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    }
    
    
    func callCellImagePicker(forCell indexPath:IndexPath, cell:UITableViewCell, stackView:UIStackView) {
        let cameraAlert = LMCameraAlert.sharedInstance
        self.lastSelectedIndex = indexPath
        cameraAlert.alert(view: self, title: "Attach Photos", message: "")
        cameraAlert.onPhotoPicked = { photoPicked in
            if let photo = photoPicked as? UIImage, (self.lastSelectedIndex != nil) {
                self.imageCells[self.lastSelectedIndex!.row].images.append(photo)
                self.cameraTable.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard   let cell = cell as? SampleTableViewCell,
            let imageUrlString = imageCells[indexPath.row].images.first
                else { return }
        cell.cellImageView?.image = imageUrlString
        for (i,each) in imageCells[indexPath.row].images.enumerated() {
            let imageView = UIImageView(image: each)
            let xPos =  CGFloat(i) * (imageSize+imagePadding)
            imageView.frame = CGRect(x: xPos, y: imagePadding, width: imageSize, height: imageSize)
            imageView.tag = i
            cell.imageStackview.addSubview(imageView)
        }
        cell.imageStackview.tag = indexPath.row
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? SampleTableViewCell else { return }
        cell.removeAllImagesFromStack()
    }
}
