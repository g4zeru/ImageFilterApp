//
//  FilterListCollectionViewCell.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/20.
//  Copyright © 2019 teranyan. All rights reserved.
//

import UIKit
import SnapKit

class FilterListCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let label = UILabel()
    
    private let imageViewLayoutWidthSizeRatio = 0.7
    
    override func awakeFromNib() {
        self.contentView.addSubview(self.imageView)
        self.label.addSubview(self.label)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.label.translatesAutoresizingMaskIntoConstraints = false
        setupLayout()
    }
    private func setupLayout() {
        self.imageView.snp.makeConstraints { (constraint) in
            constraint.size.equalToSuperview().multipliedBy(self.imageViewLayoutWidthSizeRatio)
            constraint.centerX.equalToSuperview()
            constraint.top.equalToSuperview().offset(10)
        }
        self.label.snp.makeConstraints { (constraint) in
            constraint.width.equalTo(self.imageView.snp.width)
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.imageView.snp.bottom).offset(5)
            constraint.bottom.equalToSuperview().offset(5)
        }
    }
    func setupView(text: String?, image: UIImage?) {
        self.imageView.image = image
        self.label.text = text
    }
}
