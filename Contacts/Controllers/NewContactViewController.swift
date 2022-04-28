//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Adilkhan Muratov on 28.04.2022.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet weak var firstnameLabel: UITextField!
    @IBOutlet weak var lastnameLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveNewContactButtonDidTap(_ sender: UIButton) {
        print("trying to save new contact...")
        
        let contact = Contact(
            id: ContactDb.dbInstance.getNewId(),
            firstname: firstnameLabel.text ?? "",
            lastname: lastnameLabel.text ?? "",
            phoneNumber: phoneNumberLabel.text ?? "",
            birthday: birthdayDatePicker.date)
        let db = ContactDb.dbInstance
        db.save(contact: contact) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
