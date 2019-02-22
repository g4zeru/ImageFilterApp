//
//  CustomGaussianFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/22.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomGaussianFilter: CIFilter {
    
    private var inputImage: CIImage?
    private var radius: NSNumber = 0.0
    
    override var outputImage: CIImage? {
        guard let inputImage = self.inputImage else {
            return nil
        }
        guard let affineClampFilter = CIFilter(name: "CIAffineClamp") else {
            return inputImage
        }
        let transform = CGAffineTransform(scaleX: 1, y: 1)
        affineClampFilter.setValue(inputImage, forKey: "inputImage")
        affineClampFilter.setValue(transform, forKey: "inputTransform")
        guard let affineClampedImage = affineClampFilter.outputImage else {
            return inputImage
        }
        guard let gloomFilter = CIFilter(name: "CIGaussianBlur") else {
            return affineClampedImage
        }
        gloomFilter.setValue(affineClampedImage, forKey: "inputImage")
        gloomFilter.setValue(radius, forKey: "inputRadius")
        guard let gloomedImage = gloomFilter.outputImage else {
            return affineClampedImage
        }
        guard let cropFilter = CIFilter(name: "CICrop") else {
            return gloomedImage
        }
        let originalRect = inputImage.extent
        cropFilter.setValue(gloomedImage, forKey: "inputImage")
        cropFilter.setValue(originalRect, forKey: "inputRectangle")
        guard let croppedImage = cropFilter.outputImage else {
            return gloomedImage
        }
        return croppedImage
    }
    
    static func create(image: CIImage?, radius: NSNumber) -> CIFilter {
        let filter = CustomGaussianFilter()
        filter.setDefaults()
        filter.inputImage = image
        filter.radius = radius
        return filter
    }
}
