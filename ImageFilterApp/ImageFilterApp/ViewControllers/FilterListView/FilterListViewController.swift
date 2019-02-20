//
//  FilterListViewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/20.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class FilterListViewController: BaseViewController {
    
    private let filter = ImageFilter.sharedImageFilter
    
    var image: UIImage? = nil
    
    private let preview: UIImageView = UIImageView()
    private lazy var listView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(preview)
        self.view.addSubview(listView)
        self.setupLayout()
        
        self.listView.dataSource = self
        
        self.listView.register(FilterListCollectionViewCell.self, forCellWithReuseIdentifier: "listCell")
    }
    private func setupLayout() {
        self.preview.snp.makeConstraints { (constraint) in
            constraint.size.equalToSuperview().multipliedBy(0.9)
            constraint.top.equalToSuperview().offset(20)
            constraint.centerX.equalToSuperview()
        }
        self.listView.snp.makeConstraints { (constraint) in
            constraint.leading.equalToSuperview()
            constraint.trailing.equalToSuperview()
            constraint.top.equalTo(self.preview.snp.bottom)
            constraint.bottom.equalToSuperview()
        }
    }
}
extension FilterListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filter.effectFilterCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as? FilterListCollectionViewCell else {
            fatalError()
        }
        guard let image = self.image else {
            return cell
        }
        cell.setupView(text: filter.filterName(index: indexPath.item), image: filter.filter(image: image, index: indexPath.item))
        return cell
    }
}
