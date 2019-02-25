//
//  PhotoLibraryCollectionViewCell.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/25.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class PhotoLibraryCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView = UIImageView()
    var image: UIImage?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    init() {
        super.init(frame: .zero)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.contentView.addSubview(imageView)
        self.imageView.snp.makeConstraints { (constraint) in
            constraint.top.equalToSuperview()
            constraint.bottom.equalToSuperview()
            constraint.leading.equalToSuperview()
            constraint.trailing.equalToSuperview()
        }
    }
}
