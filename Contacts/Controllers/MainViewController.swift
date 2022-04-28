//
//  ViewController.swift
//  Contacts
//
//  Created by Adilkhan Muratov on 28.04.2022.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        let config = Realm.Configuration(
            schemaVersion: 2)
        Realm.Configuration.defaultConfiguration = config
//        let realm = try! Realm()
//        try! realm.write {
//            realm.deleteAll()
//        }
        
        super.viewDidLoad()
        
        contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let db = ContactDb.dbInstance
        contacts = db.load()
        contactsTableView.reloadData()
    }
    
    var contacts = [Contact]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row].firstname) \(contacts[indexPath.row].lastname)"
        return cell
    }

    @IBAction func newContactButtonDidTap(_ sender: UIButton) {
        let newContactVC = self.storyboard?.instantiateViewController(withIdentifier: "NewContactVC")
            as! NewContactViewController
        newContactVC.title = "New Contact"
        navigationController?.pushViewController(newContactVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editContactVC = self.storyboard?.instantiateViewController(withIdentifier: "EditContactVC")
        as! EditContactViewController
        editContactVC.title = "Edit Contact"
        editContactVC.contact = contacts[indexPath.row]
        navigationController?.pushViewController(editContactVC, animated: true)
    }
    
    
}

