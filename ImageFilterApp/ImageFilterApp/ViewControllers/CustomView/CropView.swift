//
//  CropView.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/24.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CropView: UIView {
    var inputImage: UIImage? {
        get{
            return rangeView.inputImage
        }
        set(image){
            rangeView.inputImage = image
        }
    }
    let rangeView = CropRangeView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        rangeView.frame = CGRect(origin: .zero, size: frame.size)
        self.addSubview(rangeView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func crop() -> UIImage? {
        return ImageClipper.resize(view: self, size: self.frame.size)
    }
}
