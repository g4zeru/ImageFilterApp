//
//  PhotoLibraryPreviewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/25.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit
import Photos

class PhotoLibraryPreviewController: BaseViewController {
    
    private let collectionView: UICollectionView = {
        let row: Int = 4
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / CGFloat(row) - 1, height: UIScreen.main.bounds.width / CGFloat(row))
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoLibraryCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.white.cgColor
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
    }()
    
    private let cropView: CropView = CropView()
    
    private var photos: [PHAsset] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.setImage(index: 0)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        PHPhotoLibrary.requestAuthorization { [weak self] (auth) in
            switch auth {
            case .authorized:
                self?.photos = ImageAssetFetcher.fetchAsset()
            default:
                return
            }
        }
    }
    
    private func setupLayout() {
        self.view.addSubview(cropView)
        self.view.addSubview(collectionView)
        
        self.cropView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            constraint.centerX.equalToSuperview()
            constraint.width.equalTo(self.view.snp.width)
            constraint.height.equalTo(self.view.snp.width)
        }
        self.collectionView.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(self.cropView.snp.bottom)
            constraint.bottom.equalToSuperview()
            constraint.leading.equalToSuperview()
            constraint.trailing.equalToSuperview()
        }
    }
    
    private func setImage(index: Int) {
        guard 0..<photos.count ~= index else {
            return
        }
        
        let selectAsset = photos[index]
        ImageAssetFetcher.fetchImage(asset: selectAsset, imageOptions: nil, imageSize: CGSize(width: selectAsset.pixelWidth, height: selectAsset.pixelHeight)) { [weak self] (image, info) in
            self?.cropView.inputImage = image
        }
    }
}

extension PhotoLibraryPreviewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoLibraryCollectionViewCell else {
            fatalError()
        }
        cell.updateCell(asset: photos[indexPath.item])
        return cell
    }
}

extension PhotoLibraryPreviewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setImage(index: indexPath.item)
    }
}
