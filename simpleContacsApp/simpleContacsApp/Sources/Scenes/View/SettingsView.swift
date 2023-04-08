//
//  SettingsView.swift
//  simpleContacsApp
//
//  Created by Georgiy on 24.11.2022.
//

import Foundation
import UIKit

class SettingsView: UIView {
    
    lazy var contactsTableView: UITableView = {
        let contactsTableView = UITableView(frame: .zero, style: .grouped)
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        return contactsTableView
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(contactsTableView)
        contactsTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
