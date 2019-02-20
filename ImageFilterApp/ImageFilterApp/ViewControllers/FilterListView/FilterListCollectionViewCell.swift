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
    
    override func awakeFromNib() {
        self.contentView.addSubview(self.imageView)
        self.label.addSubview(self.label)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.label.translatesAutoresizingMaskIntoConstraints = false
    }
}
