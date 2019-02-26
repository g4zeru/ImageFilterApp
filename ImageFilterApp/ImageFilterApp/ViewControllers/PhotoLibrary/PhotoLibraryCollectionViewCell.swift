//
//  PhotoLibraryCollectionViewCell.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/25.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit
import Photos

class PhotoLibraryCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIImageView.ContentMode.scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var asset: PHAsset?
    
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
        self.addSubview(imageView)
        
        self.imageView.snp.makeConstraints { (constraint) in
            constraint.top.equalToSuperview()
            constraint.bottom.equalToSuperview()
            constraint.leading.equalToSuperview()
            constraint.trailing.equalToSuperview()
        }
    }
    
    func resetImage() {
        self.asset = nil
        self.imageView.image = nil
    }
    
    func updateCell(asset: PHAsset) {
        self.asset = asset
        
        ImageAssetFetcher.fetchImage(asset: asset, imageOptions: ImageAssetFetcher.imageFetchFastOption, imageSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight)) {[weak self] (image, info) in
            self?.imageView.image = image
        }
    }
}
