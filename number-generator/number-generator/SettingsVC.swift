//
//  SettingsVC.swift
//  number-generator
//
//  Created by Georgiy on 09.01.2023.
//

import Foundation
import UIKit

protocol UpdateDataProtocol: AnyObject {
    func updateData(firstNum: String,
                    secondNum: String,
                    updateMainNum: String)
}

class SettingsVC: UIViewController {
        
    var settingView: SettingsUIView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsUIView
    }

    weak var updateDataDelegate: UpdateDataProtocol?

    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        view = SettingsUIView()

        view.backgroundColor = .white
        title = "Settings"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super .init(nibName: nil, bundle: nil)
        
        addBarButtonItem()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    func addBarButtonItem() {
        let plusBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(addButtonCancel))
        navigationItem.setLeftBarButton(plusBarButton, animated: false)
        
        let plusBarButton2 = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addButtonSave))
        navigationItem.setRightBarButton(plusBarButton2, animated: false)

    }
    
    @objc func addButtonCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonSave() {
        
        let myNewNum = settingView!.firstNumField.text!
        let mySecNewNum = settingView!.secondNumField.text!

        guard let findFirstText = settingView!.firstNumField.text?.isEmpty else { return }
        guard let findSecText = settingView!.secondNumField.text?.isEmpty else { return }

        let updateMainNum = "Tapped for look num..."

        if !findFirstText || !findSecText {
            updateDataDelegate?.updateData(firstNum: myNewNum,
                                           secondNum: mySecNewNum,
                                           updateMainNum:updateMainNum)
        }
        
        dismiss(animated: true, completion: nil)
    }
}
