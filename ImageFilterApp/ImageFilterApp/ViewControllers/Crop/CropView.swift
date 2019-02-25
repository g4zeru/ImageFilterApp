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
    private let rangeView = CropRangeView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLayout()
    }
    
    init() {
        super.init(frame: .zero)
        
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(rangeView)
        
        rangeView.snp.makeConstraints { (constraint) in
            constraint.top.equalToSuperview()
            constraint.bottom.equalToSuperview()
            constraint.leading.equalToSuperview()
            constraint.trailing.equalToSuperview()
        }
    }
    
    func crop() -> UIImage? {
        return ImageClipper.resize(view: self, size: self.frame.size)
    }
}
