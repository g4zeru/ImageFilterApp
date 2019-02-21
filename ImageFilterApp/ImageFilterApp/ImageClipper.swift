//
//  ImageCripper.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/21.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class ImageClipper {
    static func resize(image: UIImage, size: CGSize) -> UIImage? {
        let widthRatio = size.width / image.size.width
        let heightRatio = size.height / image.size.height
        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
        
        let resizedSize = CGSize(width: image.size.width * ratio, height: image.size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: resizedSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

