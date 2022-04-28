//
//  Contact.swift
//  Contacts
//
//  Created by Adilkhan Muratov on 28.04.2022.
//

import Foundation
import RealmSwift

class Contact: Object {
    @Persisted var id: Int = 0
    @Persisted var firstname: String = ""
    @Persisted var lastname: String = ""
    @Persisted var phoneNumber: String = ""
    @Persisted var birthday: Date?
    
    convenience init(id: Int, firstname: String, lastname: String, phoneNumber: String, birthday: Date) {
        self.init()
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.phoneNumber = phoneNumber
        self.birthday = birthday
    }
}
