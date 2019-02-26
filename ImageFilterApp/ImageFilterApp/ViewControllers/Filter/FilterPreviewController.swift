//
//  FilterPreviewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/25.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class FilterPreviewController: BaseViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20)
        layout.itemSize = CGSize(width: 150, height: 150)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FilterListCollectionViewCell.self, forCellWithReuseIdentifier: "filterCell")
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
    }()
    private let cropView: CropView = CropView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(self.cropView)
        self.view.addSubview(self.collectionView)
        
        self.cropView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            constraint.centerX.equalToSuperview()
            constraint.width.equalTo(self.view.snp.width)
            constraint.height.equalTo(self.view.snp.width)
        }
        self.collectionView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(self.cropView.snp.bottom)
            constraint.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            constraint.leading.equalToSuperview()
            constraint.trailing.equalToSuperview()
        }
    }
}
