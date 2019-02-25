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
    
    let filters: [String] = [""]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FilterListCollectionViewCell.self, forCellWithReuseIdentifier: "filterCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setupLayout() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (constraint) in
            
        }
    }
}

extension FilterPreviewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as? FilterListCollectionViewCell else {
            fatalError()
        }
        cell.updateLayout(image: originImage, text: filters[indexPath])
        return cell
    }
}

extension FilterPreviewController: UICollectionViewDelegate {
    
}
