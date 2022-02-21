//
//  ContactViewController.swift
//  Contact List
//
//  Created by macbook on 17/02/22.
//

import Foundation
import UIKit

protocol detailsChangeDelegate{
    func didTapSave(name: String, number: String, order: Int)
}


class ContactViewController: UIViewController{
    
    var editingDelegate: detailsChangeDelegate?
    
    @IBOutlet weak var detailsStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var NumberTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    
    var img = UIImage()
    var name = ""
    var clickCount = 0
    var number = ""
    var order:Int = 0
    var editedName = ""
    var editedNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        numberLabel.text = number
        imageView.image = img
        imageView.layer.cornerRadius = imageView.layer.bounds.width/2
        NameTextField.isHidden = true
        NumberTextField.isHidden = true
        saveBtn.isHidden = true
      
    }
    
    @IBAction func hideUnhide(_ sender: UIButton) {
        numberLabel.isHidden = true
        nameLabel.isHidden = true
        editBtn.isHidden = true
        NameTextField.placeholder = name
        NumberTextField.placeholder = number
        NameTextField.isHidden = false
        NumberTextField.isHidden = false
        saveBtn.isHidden = false
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        NameTextField.isHidden = true
        NumberTextField.isHidden = true
        saveBtn.isHidden = true
        numberLabel.isHidden = false
        nameLabel.isHidden = false
        editBtn.isHidden = false
        editProfile()
        
    }
    
    func isValidInput() -> Bool {
        guard let name = NameTextField.text, let number = NumberTextField.text else { return false }
        return !name.isEmpty && !number.isEmpty
    }
    
    func editProfile(){
        if(isValidInput()){
            let confirmAlert = UIAlertController(title: "Confirm Changes", message: "Are you sure you would like to apply the above changes to the contact?", preferredStyle: .alert)
            let cancelAction = UIAlertAction.init(title: "No", style: .destructive) { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }
            let confirmAction = UIAlertAction(title: "Yes", style: .destructive){ [weak self] UIAlertAction in
                guard let name = self?.NameTextField.text, let number = self?.NumberTextField.text, let order = self?.order else { return  }
                self?.editingDelegate?.didTapSave(name: name, number: number, order: order )
                self?.navigationController?.popToRootViewController(animated: true)
            }
            confirmAlert.addAction(cancelAction)
            confirmAlert.addAction(confirmAction)
            self.present(confirmAlert, animated: true, completion: nil)
            }
    else{
            let alertAction = UIAlertAction.init(title: "Ok", style: .default) { UIAlertAction in
                print("dismiss alert")
            }
           let alert = UIAlertController.init(title: "Error!", message: "Input field should not be empty", preferredStyle: .alert)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
        }
    }

}
