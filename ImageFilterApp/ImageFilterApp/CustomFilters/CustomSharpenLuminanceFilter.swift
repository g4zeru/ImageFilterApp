//
//  CustomSharpenLuminanceFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/22.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomSharpenLuminanceFilter: CIFilter {
    private var inputImage: CIImage?
    private var sharpness: Float?
    
    class var sharpnessMaximumValue: Float {
        return 1.00
    }
    class var sharpnessMinimumValue: Float {
        return 0.00
    }
    class var sharpnessDefaultValue: Float {
        return 0.40
    }
    
    override var outputImage: CIImage? {
        guard let inputImage = self.inputImage else {
            return nil
        }
        guard let sharpenLuminanceFilter = CIFilter(name: "CISharpenLuminance") else {
            return inputImage
        }
        sharpenLuminanceFilter.setValue(inputImage, forKey: "inputImage")
        sharpenLuminanceFilter.setValue(self.sharpness, forKey: "inputSharpness")
        guard let sharpenLuminanceImage = sharpenLuminanceFilter.outputImage else {
            return inputImage
        }
        return sharpenLuminanceImage
    }
    
    static func create(image: CIImage?, sharpness: Float) -> CIFilter {
        let filter = CustomSharpenLuminanceFilter()
        filter.inputImage = image
        filter.sharpness = sharpness
        return filter
    }
}
