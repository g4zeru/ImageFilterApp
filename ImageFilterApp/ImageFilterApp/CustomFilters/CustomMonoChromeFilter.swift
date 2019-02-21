//
//  CustomMonoChromeFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/21.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomMonoChromeFilter {
    class var A1: CIColor {
        return CIColor(red: 180/255, green: 180/255, blue: 60/255, alpha: 0.8, colorSpace: CGColorSpace(name: CGColorSpace.displayP3)!)!
    }
    class var A2: CIColor {
        return CIColor(red: 160/255, green: 150/255, blue: 60/255, alpha: 0.8, colorSpace: CGColorSpace(name: CGColorSpace.displayP3)!)!
    }
    class var A3: CIColor {
        return CIColor(red: 160/255, green: 130/255, blue: 100/255, alpha: 0.8, colorSpace: CGColorSpace(name: CGColorSpace.displayP3)!)!
    }
    
    
    static func filter(image: CIImage?, color: CIColor) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorMonochrome") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(color, forKey: "inputColor")
        filter.setValue(0.8, forKey: "inputIntensity")
        return filter
    }
}
