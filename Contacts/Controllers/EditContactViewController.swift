//
//  EditContactViewController.swift
//  Contacts
//
//  Created by Adilkhan Muratov on 28.04.2022.
//

import UIKit

class EditContactViewController: UIViewController {
    
    var contact: Contact?
    
    @IBOutlet weak var firstnameLabel: UITextField!
    @IBOutlet weak var lastnameLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var birthdaydatepicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let contact = self.contact {
            print("..loading contact: \(contact)")
            firstnameLabel.text = contact.firstname
            lastnameLabel.text = contact.lastname
            phoneNumberLabel.text = contact.phoneNumber
            birthdaydatepicker.date = contact.birthday ?? Date()
        }
    }
    
    @IBAction func saveChangesButtonDidTap(_ sender: UIButton) {
        print("trying to save changes...")
        
        let contact = Contact(
            id: self.contact!.id,
            firstname: firstnameLabel.text ?? "",
            lastname: lastnameLabel.text ?? "",
            phoneNumber: phoneNumberLabel.text ?? "",
            birthday: birthdaydatepicker.date)
        let db = ContactDb.dbInstance
        db.update(contact: contact) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButtonDidTap(_ sender: UIButton) {
        print("trying to delete contact...")
        let db = ContactDb.dbInstance
        db.delete(contact: contact!) {
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
