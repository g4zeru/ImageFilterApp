//
//  FilterListCollectionView.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/25.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class FilterListCollectionViewCell: UICollectionViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 15)
        return label
    }()
    private let imageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(self.label)
        self.addSubview(self.imageView)
        
        self.label.snp.makeConstraints { (constraint) in
            constraint.top.equalToSuperview()
            constraint.centerX.equalToSuperview()
            constraint.leading.equalToSuperview().offset(5)
        }
        self.imageView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(self.label.snp.bottom).offset(5)
            constraint.bottom.equalToSuperview().offset(-5)
            constraint.centerX.equalToSuperview()
            constraint.width.equalTo(self.imageView.snp.height)
        }
    }
    
    func updateLayout(image: UIImage?, text: String?) {
        self.imageView.image = image
        self.label.text = text
    }
}
