//
//  CustomFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/26.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomFilter: CIFilter {
    var inputImage: CIImage?
    var filterName: String {
        return "CustomFilter"
    }
    override var outputImage: CIImage? {
        return inputImage
    }
}
