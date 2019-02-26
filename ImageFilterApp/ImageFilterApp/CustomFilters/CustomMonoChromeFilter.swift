//
//  CustomMonoChromeFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/21.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomMonoChromeFilter: CIFilter {
    
    class var A1: CIColor {
        return CIColor(red: 180/255, green: 180/255, blue: 60/255, alpha: 0.8, colorSpace: CGColorSpace(name: CGColorSpace.displayP3)!)!
    }
    class var A2: CIColor {
        return CIColor(red: 160/255, green: 150/255, blue: 60/255, alpha: 0.8, colorSpace: CGColorSpace(name: CGColorSpace.displayP3)!)!
    }
    class var A3: CIColor {
        return CIColor(red: 160/255, green: 130/255, blue: 100/255, alpha: 0.8, colorSpace: CGColorSpace(name: CGColorSpace.displayP3)!)!
    }
    
    private var inputImage: CIImage?
    private var color: CIColor?
    private var intensity: NSNumber?
    
    override var outputImage: CIImage? {
        guard let inputImage = self.inputImage else {
            return nil
        }
        guard let monoChromeFilter: CIFilter = CIFilter(name: "CIColorMonoChrome") else {
            return inputImage
        }
        monoChromeFilter.setDefaults()
        monoChromeFilter.setValue(inputImage, forKey: "inputImage")
        monoChromeFilter.setValue(self.color, forKey: "inputColor")
        monoChromeFilter.setValue(self.intensity, forKey: "inputIntensity")
        return monoChromeFilter.outputImage
    }
    
    static func create(image: CIImage?, color: CIColor, intensity: NSNumber) -> CIFilter {
        let filter = CustomMonoChromeFilter()
        filter.inputImage = image
        filter.color = color
        filter.intensity = intensity
        return filter
    }
}
