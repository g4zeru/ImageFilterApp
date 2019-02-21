//
//  CustomColorClamp.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/21.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomColorClamp {
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
    static func filter(image: CIImage?, min: CIVector, max: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorClamp") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(min, forKey: "inputMinComponents")
        filter.setValue(max, forKey: "inputMaxComponents")
        return filter
    }
}
