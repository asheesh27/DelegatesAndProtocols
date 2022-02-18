//
//  ViewController.swift
//  Contact List
//
//  Created by macbook on 17/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let contacts = [["zachary","+044 5078953"],["thampaan","+91 7849302348"],["hussain","+891 983239492"],["yudhistir","+011 2255"],["anaswara","+484 6784573"],["giselle","+982345682398"],["cleopatra","0478 2342341"],["shanmughan","443 57842934"],["nelsona","+91 9002300492"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController?{
            vc.img = UIImage(named: contacts[indexPath.row][0])!
            vc.name = contacts[indexPath.row][0].capitalized
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        let contact = contacts[indexPath.row][0]
        cell.contactImage.image = UIImage(named: contact)
        cell.ContactName.text = contact.capitalized
        cell.contactNumber.text = contacts[indexPath.row][1]
        return cell
    }
    
    
}
