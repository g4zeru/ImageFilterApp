//
//  CropRangeView.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/23.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CropRangeView: UIScrollView {
    
    private var contentView: UIImageView?
    
    var inputImage: UIImage? {
        get {
            return originImage
        }
        set(image) {
            self.originImage = image
            self.setupLayout()
        }
    }
    
    private var originImage: UIImage?
    
    private func setupLayout() {
        self.backgroundColor = UIColor.yellow
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        self.minimumZoomScale = 1.0
        self.maximumZoomScale = 4.0
        
        self.bounces = true
        self.delegate = self
        
        guard let image = originImage else {
            return
        }
        self.contentSize = self.contentSize(imageSize: image.size)
        self.contentView?.removeFromSuperview()
        self.contentView = UIImageView(frame: CGRect(origin: .zero, size: self.contentSize))
        self.contentView?.image = self.originImage
        self.contentView?.backgroundColor = UIColor.red
        
        self.addSubview(contentView!)
    }
    
    private func contentSize(imageSize: CGSize) -> CGSize {
        if imageSize.width - imageSize.height == 0 {
            if self.frame.size.width - self.frame.size.height > 0 {
                return CGSize(width: self.frame.width + 1, height: self.frame.width + 1)
            } else {
                return CGSize(width: self.frame.height + 1, height: self.frame.height + 1)
            }
        } else {
            if imageSize.width - imageSize.height > 0 {
                let ratio = imageSize.width / imageSize.height
                return CGSize(width: self.frame.height * ratio + 1, height:self.frame.height + 1)
            } else {
                let ratio = imageSize.height / imageSize.width
                return CGSize(width: self.frame.width + 1, height: self.frame.width * ratio + 1)
            }
        }
    }
}
extension CropRangeView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }
}
