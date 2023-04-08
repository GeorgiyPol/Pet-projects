//
//  MainUIView.swift
//  number-generator
//
//  Created by Georgiy on 09.01.2023.
//

import Foundation
import UIKit

class MainUIView: UIView {
    
    private let fromLabel: UILabel = {
        let fromLabel = UILabel()
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        fromLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        fromLabel.text = "From:"
        return fromLabel
    }()
    
    var fromNumLabel: UILabel = {
        let fromNumLabel = UILabel()
        fromNumLabel.translatesAutoresizingMaskIntoConstraints = false
        fromNumLabel.font = UIFont.systemFont(ofSize: 30, weight: .light)
        fromNumLabel.text = "0"
        return fromNumLabel
    }()
    
    private let toLabel: UILabel = {
        let toLabel = UILabel()
        toLabel.translatesAutoresizingMaskIntoConstraints = false
        toLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        toLabel.text = "To:"
        return toLabel
    }()
    
     var toNumLabel: UILabel = {
        let toNumLabel = UILabel()
        toNumLabel.translatesAutoresizingMaskIntoConstraints = false
        toNumLabel.font = UIFont.systemFont(ofSize: 30, weight: .light)
        toNumLabel.text = "100"
        return toNumLabel
    }()
    
    var mainNumber: UILabel = {
        let mainNumber = UILabel()
        mainNumber.translatesAutoresizingMaskIntoConstraints = false
        mainNumber.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        mainNumber.text = "Tapped for look num..."
        return mainNumber
    }()
    
    private var buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.setTitle("Get Result", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTappedAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        addSubview(fromLabel)
        addSubview(fromNumLabel)
        addSubview(toLabel)
        addSubview(toNumLabel)
        addSubview(buttonView)
        addSubview(mainNumber)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            fromLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            fromLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            fromNumLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            fromNumLabel.leadingAnchor.constraint(equalTo: fromLabel.trailingAnchor, constant: 10),
            fromNumLabel.centerYAnchor.constraint(equalTo: fromLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            toLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            toLabel.leadingAnchor.constraint(equalTo: fromNumLabel.trailingAnchor, constant: 50),
            toLabel.centerYAnchor.constraint(equalTo: toLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            toNumLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            toNumLabel.leadingAnchor.constraint(equalTo: toLabel.trailingAnchor, constant: 10),
            toNumLabel.centerYAnchor.constraint(equalTo: toLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            buttonView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250),
            
            buttonView.heightAnchor.constraint(equalToConstant: 40),
            buttonView.widthAnchor.constraint(equalToConstant: 280)
        ])
        
        NSLayoutConstraint.activate([
            mainNumber.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            mainNumber.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant: -50)
        ])
        
    }
    
    @objc func buttonTappedAction(_ sender: Any) {
        let a = Int(fromNumLabel.text!)
        let b = Int(toNumLabel.text!)
        
        mainNumber.text = String(Int.random(in: a!...b!))
    }
}
