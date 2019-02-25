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
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(PhotoLibraryCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
        return collectionView
    }()
    
    var photos: [PHAsset] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return cell
    }
}

extension PhotoLibraryPreviewController: UICollectionViewDelegate {
    
}

extension PhotoLibraryPreviewController: UICollectionViewDelegateFlowLayout {
    
}
