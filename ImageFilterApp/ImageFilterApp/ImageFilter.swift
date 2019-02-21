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
    
    private let context: CIContext
    
    init() {
        self.context = CIContext(options: nil)
    }
    
    func createImage(filter: CIFilter?) -> UIImage? {
        guard let ciImageData = filter?.outputImage, let rect = filter?.outputImage?.extent else {
            return nil
        }
        guard let imageData = self.context.createCGImage(ciImageData, from: rect, format: CIFormat.RGBA8, colorSpace: CGColorSpace(name: CGColorSpace.displayP3)) else {
            return nil
        }
        return UIImage(cgImage: imageData)
    }
}
