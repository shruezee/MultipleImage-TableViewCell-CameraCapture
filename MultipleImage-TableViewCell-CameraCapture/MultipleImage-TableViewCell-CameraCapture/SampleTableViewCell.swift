//
//  SampleTableViewCell.swift
//  cameraDemo
//
//  Created by Shruthi Ramakrishnaiah on 2/12/19.
//  Copyright © 2019 Shruthi Ramakrishnaiah. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView:UIImageView!
    @IBOutlet weak var addButton:UIButton!
    @IBOutlet weak var imageStackview:UIStackView!
    @IBOutlet weak var cellTitle:UILabel!
    var addImagePressed: ((UIStackView) -> Void)?
    
    @IBAction func addImageButtonPressed(_ sender: UIButton) {
        addImagePressed?(imageStackview)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
//        cellImageView.image = nil
        removeAllImagesFromStack()
    }
    
    func removeAllImagesFromStack() {
        for each in imageStackview.subviews {
            if let imageviewFromStack = each as? UIImageView {
                imageviewFromStack.removeFromSuperview()
            }
        }
    }
    
 override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
