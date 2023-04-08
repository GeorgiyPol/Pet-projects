//
//  SettingsModel.swift
//  iphone-settings-screen-App
//
//  Created by Georgiy on 28.11.2022.
//

import Foundation
import UIKit

class SettingsModel {
    
    var models = [Section]()
    
    func createModels() -> [Section] {
        models.append(Section(option: [
            .switchCell(model: SettingsSwitchOption(title: CellTitle.sectionOneCellOne.rawValue,
                                                    icon: UIImage(systemName: Image.sectionOneCellOne.rawValue),
                                                    iconBackgroungColor: Color.firstColor,
                                                    isOn: false)
                                                    { print("Нажата ячейка \($0)") } ),

            .someInfoCell(model: SettingInfo(title: CellTitle.sectionOneCellTwo.rawValue,
                                             icon: UIImage(systemName: Image.sectionOneCellTwo.rawValue),
                                             iconBackgroungColor: Color.secondColor,
                                             titleInfo: "Не подключено")
                                             { print("Нажата ячейка \($0)") }),

            .someInfoCell(model: SettingInfo(title: CellTitle.sectionOneCellThree.rawValue,
                                             icon: UIImage(named: Image.sectionOneCellThree.rawValue),
                                             iconBackgroungColor: Color.secondColor,
                                             titleInfo: "Вкл.")
                                             { print("Нажата ячейка \($0)") }),
            
            .staticCell(model: SettingsOption(title: CellTitle.sectionOneCellFour.rawValue,
                                             icon: UIImage(systemName: Image.sectionOneCellFour.rawValue),
                                             iconBackgroungColor: Color.thirdColor)
                                             { print("Нажата ячейка \($0)") }),
            
            .staticCell(model: SettingsOption(title: CellTitle.sectionOneCellFive.rawValue, icon:
                                              UIImage(systemName: Image.sectionOneCellFive.rawValue),
                                              iconBackgroungColor: Color.thirdColor)
                                              { print("Нажата ячейка \($0)") }),
            
            .switchCell(model: SettingsSwitchOption(title: CellTitle.sectionOneCellSix.rawValue,
                                                    icon: UIImage(named: Image.sectionOneCellSix.rawValue),
                                                    iconBackgroungColor: Color.fourColor,
                                                    isOn: false)
                                                    { print("Нажата ячейка \($0)") })
        ]))
        
        models.append(Section(option: [
            .staticCell(model: SettingsOption(title: CellTitle.sectionTwoCellOne.rawValue,
                                              icon: UIImage(systemName: Image.sectionTwoCellOne.rawValue),
                                              iconBackgroungColor: Color.fiveColor)
                                              { print("Нажата ячейка \($0)") }),

            .staticCell(model:SettingsOption(title: CellTitle.sectionTwoCellTwo.rawValue,
                                             icon: UIImage(systemName: Image.sectionTwoCellTwo.rawValue),
                                             iconBackgroungColor: Color.fiveColor)
                                             { print("Нажата ячейка \($0)") }),

            .staticCell(model:SettingsOption(title: CellTitle.sectionTwoCellThree.rawValue,
                                             icon: UIImage(systemName: Image.sectionTwoCellThree.rawValue),
                                             iconBackgroungColor: Color.sevenColor)
                                             { print("Нажата ячейка \($0)") }),

            .staticCell(model:SettingsOption(title: CellTitle.sectionTwoCellFour.rawValue,
                                             icon: UIImage(systemName: Image.sectionTwoCellFour.rawValue),
                                             iconBackgroungColor: Color.sevenColor)
                                             { print("Нажата ячейка \($0)") })
        ]))

        models.append(Section(option: [
            .notificationCell(model: SettingNotification(title: CellTitle.sectionThreeCellOne.rawValue,
                                                         icon: UIImage(systemName: Image.sectionThreeCellOne.rawValue),
                                                         iconBackgroungColor: Color.sixColor,
                                                         titleInfo: "1")
                                                         { print("Нажата ячейка \($0)") } ),

            .staticCell(model:SettingsOption(title: CellTitle.sectionThreeCellTwo.rawValue,
                                             icon: UIImage(systemName: Image.sectionThreeCellTwo.rawValue),
                                             iconBackgroungColor: .systemGray)
                                             { print("Нажата ячейка \($0)") }),

            .staticCell(model:SettingsOption(title: CellTitle.sectionThreeCellThree.rawValue,
                                             icon: UIImage(systemName: Image.sectionThreeCellThree.rawValue),
                                             iconBackgroungColor: Color.secondColor)
                                             { print("Нажата ячейка \($0)") }),

            .staticCell(model:SettingsOption(title: CellTitle.sectionThreeCellFour.rawValue,
                                             icon: UIImage(systemName: Image.sectionThreeCellFour.rawValue),
                                             iconBackgroungColor: Color.secondColor)
                                             { print("Нажата ячейка \($0)") }),

            .staticCell(model:SettingsOption(title: CellTitle.sectionThreeCellFive.rawValue,
                                             icon: UIImage(systemName: Image.sectionThreeCellFive.rawValue),
                                             iconBackgroungColor: Color.secondColor)
                                             { print("Нажата ячейка \($0)") })
        ]))
        
        return models
    }
}
