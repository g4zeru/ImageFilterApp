//
//  ImageFetcher.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/25.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import Photos

class ImageAssetFetcher {
    class var thumbnailImageSize: CGSize {
        return CGSize(width: 50, height: 50)
    }
    class var imageSize: CGSize {
        return CGSize(width: 300, height: 300)
    }
    static let mediaOptions: PHFetchOptions = {
        let sortOptions: [NSSortDescriptor] = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let options: PHFetchOptions = PHFetchOptions()
        options.fetchLimit = 500
        options.sortDescriptors = sortOptions
        return options
    }()
    static let imageFetchFastOption: PHImageRequestOptions = {
        let option = PHImageRequestOptions()
        option.resizeMode = .fast
        return option
    }()
    
    static func fetchAsset() -> [PHAsset] {
        let asset: PHFetchResult = PHAsset.fetchAssets(with: .image, options: mediaOptions)
        return asset.objects(at: IndexSet(integersIn: 0...asset.count - 1))
    }
    static func fetchImage(asset: PHAsset, imageOptions: PHImageRequestOptions?, imageSize: CGSize, completion: @escaping (UIImage?,[AnyHashable: Any]?)->()) {
        PHImageManager().requestImage(for: asset, targetSize: imageSize, contentMode: .default, options: imageOptions, resultHandler: completion)
    }
}
