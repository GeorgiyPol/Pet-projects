//
//  ListHeaderCollectionReusableView.swift
//  iphone photo app clone
//
//  Created by Georgiy on 23.12.2022.
//

import Foundation
import UIKit

class ListHeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "ListHeaderCollectionReusableView"

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
