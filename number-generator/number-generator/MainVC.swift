//
//  MainVC.swift
//  number-generator
//
//  Created by Georgiy on 09.01.2023.
//

import Foundation
import UIKit

class MainVC: UIViewController {
        
    var mainView: MainUIView? {
        guard isViewLoaded else { return nil }
        return view as? MainUIView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = MainUIView()
        configure()
        addBarButtonItem()
    }
    
    func configure() {
        view.backgroundColor = .white
        title = "Random Number"
    }
    
    func addBarButtonItem() {
        let plusBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addButtonClick))
        navigationItem.setRightBarButton(plusBarButton, animated: false)
    }
    
    @objc func addButtonClick() {
        
        let settVC = SettingsVC()
        let navigationController = UINavigationController(rootViewController: settVC)
        settVC.updateDataDelegate = self
        
        present(navigationController, animated: true)
    }
    
 
}

extension MainVC: UpdateDataProtocol {

    func updateData(firstNum: String,
                    secondNum: String,
                    updateMainNum: String) {

        self.mainView?.fromNumLabel.text = firstNum
        self.mainView?.toNumLabel.text = secondNum

        self.mainView?.mainNumber.text = updateMainNum
    }
}
