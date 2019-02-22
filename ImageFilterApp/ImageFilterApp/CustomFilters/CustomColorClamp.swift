//
//  CustomColorClamp.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/21.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomColorClampFilter: CIFilter {
    class var min_A1: CIVector {
        return CIVector(x: 0.08, y: 0.12, z: 0.10, w: 0.00)
    }
    class var max_A1: CIVector {
        return CIVector(x: 0.5, y: 0.8, z: 0.7, w: 0.8)
    }
    
    class var min_A2: CIVector {
        return CIVector(x: 0.00, y: 0.00, z: 0.00, w: 0.00)
    }
    class var max_A2: CIVector {
        return CIVector(x: 0.3, y: 0.5, z: 0.7, w: 0.9)
    }
    
    private var inputImage: CIImage?
    private var minimumVector: CIVector?
    private var maximumVector: CIVector?
    
    override var outputImage: CIImage? {
        guard let inputImage = self.inputImage else {
            return nil
        }
        guard let filter = CIFilter(name: "CIColorClamp") else {
            return inputImage
        }
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(minimumVector, forKey: "inputMinComponents")
        filter.setValue(maximumVector, forKey: "inputMaxComponents")
        return filter.outputImage
    }
    
    static func create(image: CIImage?, min: CIVector, max: CIVector) -> CIFilter? {
        let filter = CustomColorClampFilter()
        filter.inputImage = image
        filter.minimumVector = min
        filter.maximumVector = max
        return filter
    }
}
