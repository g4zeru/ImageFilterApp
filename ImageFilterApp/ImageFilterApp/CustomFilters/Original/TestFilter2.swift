//
//  TestFilter2.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/26.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class TestFilter2: CustomFilter {
    
    override var outputImage: CIImage? {
        return self.cropFilter(image: self.hexagonalPixellateFilter(image: self.colorCrossPolynomialFilter(image: self.inputImage)))
    }
    
    private func colorCrossPolynomialFilter(image: CIImage?) -> CIImage? {
        guard let colorCrossPolynomialFilter = CIFilter(name: "CIColorCrossPolynomial") else {
            return image
        }
        colorCrossPolynomialFilter.setValue(image, forKey: "inputImage")
        colorCrossPolynomialFilter.setValue(CIVector(string: "[1 0 0 0 1 0 0 0 0 0 0]"), forKey: "inputRedCoefficients")
        colorCrossPolynomialFilter.setValue(CIVector(string: "[0 1 0 0 0 0 0 1 0 0 0]"), forKey: "inputGreenCoefficients")
        colorCrossPolynomialFilter.setValue(CIVector(string: "[0 0 1 0 0 0 0 0 1 0 0]"), forKey: "inputBlueCoefficients")
        return colorCrossPolynomialFilter.outputImage
    }
    
    private func hexagonalPixellateFilter(image: CIImage?) -> CIImage? {
        guard let hexagonalPixellateFilter = CIFilter(name: "CIHexagonalPixellate") else {
            return image
        }
        hexagonalPixellateFilter.setValue(image, forKey: "inputImage")
        hexagonalPixellateFilter.setValue(CIVector(x: 50, y: 50), forKey: "inputCenter")
        hexagonalPixellateFilter.setValue((inputImage?.extent.width)! / 60, forKey: "inputScale")
        return hexagonalPixellateFilter.outputImage
    }
    
    private func cropFilter(image: CIImage?) -> CIImage? {
        guard let cropFilter = CIFilter(name: "CICrop") else {
            return image
        }
        let originalRect = inputImage?.extent
        cropFilter.setValue(image, forKey: "inputImage")
        cropFilter.setValue(originalRect, forKey: "inputRectangle")
        return cropFilter.outputImage
    }
}
