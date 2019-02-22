//
//  CustomGloomFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/21.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomGloomFilter: CIFilter {
    fileprivate var inputImage: CIImage?
    fileprivate var radius: NSNumber = 0.0
    fileprivate var intensity: NSNumber = 0.0
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
        guard let gloomFilter = CIFilter(name: "CIGloom") else {
            return affineClampedImage
        }
        gloomFilter.setValue(affineClampedImage, forKey: "inputImage")
        gloomFilter.setValue(radius, forKey: "inputRadius")
        gloomFilter.setValue(intensity, forKey: "inputIntensity")
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
    static func create(image: CIImage?, radius: NSNumber, intensity: NSNumber) -> CIFilter {
        let filter = CustomGloomFilter()
        filter.setDefaults()
        filter.inputImage = image
        filter.radius = radius
        filter.intensity = intensity
        return filter
    }
}
