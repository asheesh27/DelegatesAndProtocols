//
//  ContactCell.swift
//  Contact List
//
//  Created by macbook on 17/02/22.
//

import UIKit

class ContactCell: UITableViewCell {

    
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var ContactName: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
