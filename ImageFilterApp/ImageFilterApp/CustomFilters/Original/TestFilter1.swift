//
//  TestFilter1.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/26.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class TestFilter1: BaseCustomFilter {
    override var filterName: String {
        return "TestFilter1"
    }
    
    override var outputImage: CIImage? {
        let monoChromeFilter = CustomMonoChromeFilter.create(image: inputImage, color: CustomMonoChromeFilter.A3, intensity: 0.8)
        let monoChromedImage = monoChromeFilter.outputImage
        let gloomFilter = CustomGloomFilter.create(image: monoChromedImage, radius: 30, intensity: 0.8)
        return gloomFilter.outputImage
    }
}
