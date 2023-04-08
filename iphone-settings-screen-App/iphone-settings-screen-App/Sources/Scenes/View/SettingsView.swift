//
//  SettingsView.swift
//  iphone-settings-screen-App
//
//  Created by Georgiy on 28.11.2022.
//

import Foundation
import UIKit

class SettingsView: UIView {
    
    lazy var tableView: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
       
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifire)
        
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifire)
        
        table.register(SettingSomeInfoOption.self,
                       forCellReuseIdentifier: SettingSomeInfoOption.identifire)
        
        table.register(SettingTableFigure.self,
                       forCellReuseIdentifier: SettingTableFigure.identifire)
        return table
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
        addSubview(tableView)
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.tableView.rowHeight = 45
    }
}
