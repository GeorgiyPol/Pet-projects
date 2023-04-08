//
//  SettingsUIView.swift
//  number-generator
//
//  Created by Georgiy on 09.01.2023.
//

import Foundation
import UIKit

class SettingsUIView: UIView {
        
    var firstNumField: UITextField = {
        let firstNumField = UITextField()
        firstNumField.placeholder = "add first num..."
        firstNumField.translatesAutoresizingMaskIntoConstraints = false
        firstNumField.borderStyle = .roundedRect
        firstNumField.textAlignment = .center
        return firstNumField
    }()
    
    var secondNumField: UITextField = {
        let secondNumField = UITextField()
        secondNumField.placeholder = "add second num..."
        secondNumField.translatesAutoresizingMaskIntoConstraints = false
        secondNumField.borderStyle = .roundedRect
        secondNumField.textAlignment = .center
        return secondNumField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: - Settings
    private func setupHierarchy() {
        addSubview(firstNumField)
        addSubview(secondNumField)
    }

    private func setupLayout() {
        
        NSLayoutConstraint.activate([

            firstNumField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            firstNumField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            
            firstNumField.widthAnchor.constraint(equalToConstant: 180),
            firstNumField.heightAnchor.constraint(equalToConstant: 20),
            
            secondNumField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            secondNumField.topAnchor.constraint(equalTo: firstNumField.bottomAnchor, constant: 30),
            
            secondNumField.widthAnchor.constraint(equalToConstant: 180),
            secondNumField.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
