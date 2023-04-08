//
//  SettingSomeInfoOption.swift
//  iphone-settings-screen-App
//
//  Created by Georgiy on 28.11.2022.
//

import Foundation
import UIKit

class SettingSomeInfoOption: UITableViewCell {
    
    static let identifire = "SettingSomeInfoOption"
    
    // MARK: - Views
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Metric.cornerRadius
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Metric.tintColor
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = Metric.numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private var labelInfo: UILabel = {
        let labelInfo = UILabel()
        labelInfo.textColor = Metric.labelInfoTextColor
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        return labelInfo
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconContainer.addSubview(iconImageView)

        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(labelInfo)
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //MARK: - iconContainer
        
        iconContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
//        NSLayoutConstraint.activate([
//            iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//            iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            iconContainer.widthAnchor.constraint(equalToConstant: 30),
//            iconContainer.heightAnchor.constraint(equalToConstant: 30),
//        ])
        
        //MARK: - iconImageView
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalTo(iconContainer)
            make.centerY.equalTo(iconContainer)
            make.width.equalTo(25)
        }
        
//        NSLayoutConstraint.activate([
//            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
//            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
//            iconImageView.widthAnchor.constraint(equalToConstant: 25),
//
//        ])
        
        //MARK: - label
        
        label.snp.makeConstraints { make in
            make.left.equalTo(iconContainer).inset(35)
            make.centerY.equalToSuperview()
        }
        
//        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalToSystemSpacingAfter: iconContainer.trailingAnchor, multiplier: 1),
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//        ])
        
        //MARK: - labelInfo
        
        labelInfo.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
        
//        NSLayoutConstraint.activate([
//            labelInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//            labelInfo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//        ])
    }
    
    // MARK: - Configuration
    public func configure(with model: SettingInfo){
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroungColor
        labelInfo.text = model.titleInfo
    }
}

extension SettingSomeInfoOption {
    
    enum Metric {
        static var cornerRadius: CGFloat = 8
        static var tintColor = UIColor.white
        static var labelInfoTextColor = UIColor.gray
        static var numberOfLines = 1
        static var iconContainerFrameX: CGFloat = 12
        static var iconContainerFrameY: CGFloat = 6
        static var labelFrameX: CGFloat = 25
        static var labelFrameY: CGFloat = 0
        static var mySwitchColor = UIColor.systemGreen
    }
}
