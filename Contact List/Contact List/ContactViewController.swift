//
//  ContactViewController.swift
//  Contact List
//
//  Created by macbook on 17/02/22.
//

import Foundation
import UIKit

class ContactViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var img = UIImage()
    var name = ""
    var clickCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        imageView.image = img
        imageView.layer.cornerRadius = imageView.layer.bounds.width/2
    }
    @IBAction func hideUnhide(_ sender: Any) {
        clickCount += 1
        if clickCount%2 == 1{
            nameLabel.alpha = 1.0
        }else{
            nameLabel.alpha = 0.0
        }
    }
}
