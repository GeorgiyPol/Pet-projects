//
//  SettingTableViewCell.swift
//  iphone-settings-screen-App
//
//  Created by Georgiy on 28.11.2022.
//

import Foundation
import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {
    
    static let identifire = "SettingTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        
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
        }
//        NSLayoutConstraint.activate([
//            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
//            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
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
    }
    
    // MARK: - Configuration
    
    public func configure(with model: SettingsOption){
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroungColor
    }
}

extension SettingTableViewCell {
    enum Metric {
        static var cornerRadius: CGFloat = 8
        static var tintColor = UIColor.white
        static var numberOfLines = 1
        static var iconContainerFrameX: CGFloat = 12
        static var iconContainerFrameY: CGFloat = 6
        static var labelFrameX: CGFloat = 25
        static var labelFrameY: CGFloat = 0
    }
}
