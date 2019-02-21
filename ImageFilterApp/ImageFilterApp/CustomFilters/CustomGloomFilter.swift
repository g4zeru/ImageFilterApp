//
//  CustomGloomFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/21.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomGloomFilter {
    
    static func filter(image: CIImage?, radius: NSNumber, intensity: NSNumber) -> CIFilter {
        guard let filter = CIFilter(name: "CIGloom") else {
            fatalError()
        }
        filter.setDefaults()
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(radius, forKey: "inputRadius")
        filter.setValue(intensity, forKey: "inputIntensity")
        return filter
    }
}
