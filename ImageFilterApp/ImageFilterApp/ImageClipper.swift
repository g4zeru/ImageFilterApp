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
    
    static func resize(view: UIView, size: CGSize) -> UIImage? {
        
        
        guard view.frame.size.width > 0 &&
            view.frame.size.height > 0 &&
            size.width > 0 &&
            size.height > 0 else {
            return nil
        }
        
        let widthRatio = size.width / view.frame.size.width
        let heightRatio = size.height / view.frame.size.height
        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
        
        let resizedSize = CGSize(width: view.frame.size.width * ratio, height: view.frame.size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

