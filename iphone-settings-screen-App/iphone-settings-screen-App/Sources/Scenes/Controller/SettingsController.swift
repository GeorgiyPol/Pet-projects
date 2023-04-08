//
//  SettingsController.swift
//  iphone-settings-screen-App
//
//  Created by Georgiy on 28.11.2022.
//

import Foundation
import UIKit

class SettingsController: UIViewController {

    var models = SettingsModel().createModels()
    
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

private extension SettingsController {
    func configureView() {
        title = "Настройки"
        
        settingsView?.tableView.dataSource = self
        settingsView?.tableView.delegate = self
    }
}

extension SettingsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifire,
                                                           for: indexPath) as? SettingTableViewCell
            else { return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifire,
                                                           for: indexPath) as? SwitchTableViewCell
            else { return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .someInfoCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingSomeInfoOption.identifire,
                                                           for: indexPath) as? SettingSomeInfoOption
            else { return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .notificationCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableFigure.identifire,
                                                           for: indexPath) as? SettingTableFigure
            else { return UITableViewCell() }
            cell.configure(with: model)
            return cell
        }
    }
}

extension SettingsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = models[indexPath.section].option[indexPath.row]

        switch type.self {
        case .staticCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)

        case .switchCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)

        case .someInfoCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)

        case .notificationCell(let model):
            let doubleHeader = model.title
            model.handler(doubleHeader)
        }
    }
}
