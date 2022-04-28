//
//  DbModel.swift
//  Contacts
//
//  Created by Adilkhan Muratov on 28.04.2022.
//

import Foundation
import RealmSwift

class ContactDb: NSObject {
    
    static var dbInstance = ContactDb()
    
    typealias completionHandler = () -> Void
    
    let realm = try! Realm()
    
    func getNewId() -> Int {
        return (realm.objects(Contact.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    func save(contact: Contact, _ completion: completionHandler) {
        try! realm.write {
            self.realm.add(contact)
            print("saved to db!")
            completion()
        }
    }
    
    func load() -> [Contact] {
        var contacts = [Contact]()
        try! realm.write {
            let results = self.realm.objects(Contact.self)
            contacts.append(contentsOf: results)
            print("loaded from db!")
        }
        return contacts
    }
    
    func update(contact: Contact, _ completion: completionHandler) {
        print("update...")
        let contacts = self.realm.objects(Contact.self)
        let contactRows = contacts.where {
            $0.id == contact.id
        }
        
        if let contactRow = contactRows.first {
            print("found: \(contactRow)")
            try! realm.write {
                contactRow.firstname = contact.firstname
                contactRow.lastname = contact.lastname
                contactRow.phoneNumber = contact.phoneNumber
                contactRow.birthday = contact.birthday
                completion()
            }
        }
    }
    
    func delete(contact: Contact, completion: completionHandler) {
        try! realm.write {
            self.realm.delete(contact)
            completion()
        }
    }
    
    
}
