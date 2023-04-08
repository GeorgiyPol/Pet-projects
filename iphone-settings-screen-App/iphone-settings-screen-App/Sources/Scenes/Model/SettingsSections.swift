//
//  SettingsSections.swift
//  iphone-settings-screen-App
//
//  Created by Georgiy on 28.11.2022.
//

import Foundation
import UIKit

struct Section {
    let option: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case someInfoCell(model: SettingInfo)
    case notificationCell(model: SettingNotification)
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor
    let handler: ((_ doubleHeader: String) -> Void)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor
    var isOn: Bool
    let handler: ((_ doubleHeader: String) -> Void)
}

struct SettingInfo {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor
    var titleInfo: String
    let handler: ((_ doubleHeader: String) -> Void)
}

struct SettingNotification {
    let title: String
    let icon: UIImage?
    let iconBackgroungColor: UIColor
    var titleInfo: String
    let handler: ((_ doubleHeader: String) -> Void)
}
