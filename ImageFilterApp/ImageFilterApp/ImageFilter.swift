//
//  ImageFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/20.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class ImageFilter {
    
    static let sharedImageFilter = ImageFilter()
    
    var effectFilterCount: Int {
        return self.defaultEffectFilter.count
    }
    
    private let context: CIContext
    
    private let defaultEffectFilter: [String] = ["CIColorCrossPolynomial",
                                                 "CIColorCube",
                                                 "CIColorCubeWithColorSpace",
                                                 "CIColorInvert",
                                                 "CIColorMap",
                                                 "CIColorMonochrome",
                                                 "CIColorPosterize",
                                                 "CIFalseColor",
                                                 "CIMaskToAlpha",
                                                 "CIMaximumComponent",
                                                 "CIMinimumComponent",
                                                 "CIPhotoEffectChrome",
                                                 "CIPhotoEffectFade",
                                                 "CIPhotoEffectInstant",
                                                 "CIPhotoEffectMono",
                                                 "CIPhotoEffectNoir",
                                                 "CIPhotoEffectProcess",
                                                 "CIPhotoEffectTonal",
                                                 "CIPhotoEffectTransfer",
                                                 "CISepiaTone",
                                                 "CIVignette",
                                                 "CIVignetteEffect"]
    
    init() {
        self.context = CIContext(options: nil)
    }
    
    func filter(image: UIImage, index: Int) -> UIImage? {
        guard 0..<self.effectFilterCount ~= index else {
            return nil
        }
        let filter = CIFilter(name: defaultEffectFilter[index])
        let sourceImage = CIImage(image: image)
        filter?.setDefaults()
        filter?.setValue(sourceImage, forKey: kCIInputImageKey)
        guard let ciImageData = filter?.outputImage, let rect = filter?.outputImage?.extent else {
            return nil
        }
        guard let imageData = self.context.createCGImage(ciImageData, from: rect, format: CIFormat.RGBA8, colorSpace: CGColorSpace(name: CGColorSpace.displayP3)) else {
            return nil
        }
        return UIImage(cgImage: imageData)
    }
    
    func filterName(index: Int) -> String? {
        guard 0..<self.effectFilterCount ~= index else {
            return nil
        }
        return defaultEffectFilter[index]
    }
}
