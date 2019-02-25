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
        }
    }
    
    private var originImage: UIImage?
    
    override func draw(_ rect: CGRect) {
        setupLayout()
        
        super.draw(rect)
    }
    
    private func setupLayout() {
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        self.minimumZoomScale = 1.0
        self.maximumZoomScale = 4.0
        
        self.bounces = true
        self.delegate = self
        
        guard let image = originImage else {
            return
        }
        self.contentSize = self.contentSize(imageSize: image.size, rect: self.frame)
        
        self.contentView?.removeFromSuperview()
        
        self.contentView = UIImageView(frame: CGRect(origin: .zero, size: self.contentSize))
        self.contentView?.image = self.originImage
        
        self.addSubview(contentView!)
        
    }
    
    private func contentSize(imageSize: CGSize, rect: CGRect) -> CGSize {
        var rect = rect
        let widthRatio = rect.width / imageSize.width
        let heightRatio = rect.height / imageSize.height
        
        if (widthRatio < heightRatio) {
            rect.size.width = rect.height / imageSize.height * imageSize.width
        } else if (widthRatio > heightRatio) {
            rect.size.height = rect.width / imageSize.width * imageSize.height
        }
        
        rect.size.width += 1
        rect.size.height += 1
        
        return rect.size
    }
}
extension CropRangeView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }
}
