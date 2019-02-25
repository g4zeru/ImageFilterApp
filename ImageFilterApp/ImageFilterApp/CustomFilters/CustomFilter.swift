//
//  CustomFilter.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/25.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CustomFilter: CIFilter {
    
    var filterName: String {
        return "customFilter"
    }
    func create(image: CIImage?) -> CIFilter? {
        return nil
    }
}
