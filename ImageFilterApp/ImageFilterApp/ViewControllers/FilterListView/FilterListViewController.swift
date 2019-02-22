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
    
    var image: UIImage? = UIImage(named: "lena")
    
    private let preview: UIImageView = UIImageView()
    private lazy var listView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FilterListCollectionViewCell.self, forCellWithReuseIdentifier: "listCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.backgroundColor = UIColor.white
        self.view.addSubview(preview)
        self.view.addSubview(listView)
        self.setupLayout()
        
        self.listView.dataSource = self
        self.listView.delegate = self
        
        self.preview.contentMode = .scaleAspectFit
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.preview.image = filter.createImage(filter: CustomColorClamp.filter(image: CIImage(image: self.image!), min: CustomColorClamp.min_A2, max: CustomColorClamp.max_A2))
    }
    
    private func setupLayout() {
        self.preview.snp.makeConstraints { (constraint) in
            constraint.leading.equalToSuperview().offset(20)
            constraint.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            constraint.bottom.equalTo(self.listView.snp.top).offset(20)
            constraint.centerX.equalToSuperview()
        }
        self.listView.snp.makeConstraints { (constraint) in
            constraint.leading.equalToSuperview()
            constraint.trailing.equalToSuperview()
            constraint.height.equalTo(100)
            constraint.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension FilterListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as? FilterListCollectionViewCell else {
            fatalError()
        }
        guard let image = self.image else {
            return cell
        }
        guard let resizedImage = ImageClipper.resize(image: image, size: CGSize(width: 50, height: 50)) else {
            return cell
        }
        return cell
    }
}

extension FilterListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
}

extension FilterListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
}
