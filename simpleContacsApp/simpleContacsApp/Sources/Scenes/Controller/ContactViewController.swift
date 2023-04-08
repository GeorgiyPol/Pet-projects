//
//  ViewController.swift
//  simpleContacsApp
//
//  Created by Georgiy on 24.11.2022.
//

import UIKit

class ContactViewController: UIViewController {
     
    private let contacts = ContactAPI.getContacts()
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func loadView() {
        view = SettingsView()
    }
}

extension ContactViewController {
    func configureView() {
        self.navigationItem.title = "Contacts"
        
        settingsView?.contactsTableView.dataSource = self
        settingsView?.contactsTableView.delegate = self
    }
}

extension ContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        cell.configure(with: contacts[indexPath.row])
        return cell
    }
}

extension ContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
