//
//  CustomUnshapeMaskFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/22.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomUnsharpMaskFilter: CIFilter {
    
    class var radiusMaximumValue: Float {
        return 100.00
    }
    class var radiusMinimumValue: Float {
        return 0.00
    }
    class var radiusDefaultValue: Float {
        return 10.00
    }
    
    class var intensityMaximumValue: Float {
        return 1.00
    }
    class var intensityMinimumValue: Float {
        return 0.00
    }
    class var intensityDefaultValue: Float {
        return 0.50
    }
    
    private var inputImage: CIImage?
    private var radius: NSNumber = 0.0
    private var intensity: NSNumber = 0.0
    
    override var outputImage: CIImage? {
        guard let inputImage = self.inputImage else {
            return nil
        }
        guard let unsharpMaskFilter = CIFilter(name: "CIUnsharpMask") else {
            return inputImage
        }
        unsharpMaskFilter.setValue(inputImage, forKey: "inputImage")
        unsharpMaskFilter.setValue(self.radius, forKey: "inputRadius")
        unsharpMaskFilter.setValue(self.intensity, forKey: "inputIntensity")
        guard let unsharpMaskedImage = unsharpMaskFilter.outputImage else {
            return inputImage
        }
        return unsharpMaskedImage
    }
    
    static func create(image: CIImage?, radius: NSNumber, intensity: NSNumber) -> CIFilter {
        let filter = CustomUnsharpMaskFilter()
        filter.setDefaults()
        filter.inputImage = image
        filter.radius = radius
        filter.intensity = intensity
        return filter
    }
}
