//
//  GaussianFilterPreview.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/22.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class GaussianFilterPreviewController: BaseViewController {
    
    private let preview: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let radiusSlider: UISlider = {
        let slider = UISlider()
        /// Range参照　https://qiita.com/shtnkgm/items/fb1425ef88d31fdad1d4#inputradius-11
        let radiusMaximumValue: Float = 100.00
        let radiusMinimumValue: Float = 0.00
        let radiusDefaultValue: Float = 10.00
        
        slider.maximumValue = radiusMaximumValue
        slider.minimumValue = radiusMinimumValue
        slider.value = radiusDefaultValue
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.preview)
        self.view.addSubview(self.radiusSlider)
        self.preview.image = originImage
        self.radiusSlider.addTarget(self, action: #selector(didChangeRadiusValue), for: UIControl.Event.valueChanged)
        self.setupLayer()
    }
    
    private func setupLayer() {
        self.preview.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            constraint.leading.equalToSuperview()
            constraint.bottom.equalTo(self.radiusSlider.snp.top).offset(50)
        }
        self.radiusSlider.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.leading.equalToSuperview().offset(20)
            constraint.height.equalTo(50)
            constraint.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-100)
        }
    }
    
    @objc private func didChangeRadiusValue() {
        guard let image = self.originImage else {
            return
        }
        let gaussianFilter: CIFilter = CustomGaussianFilter.create(image: CIImage(image: image), radius: NSNumber(value: self.radiusSlider.value))
        self.preview.image = self.filter.createImage(filter: gaussianFilter)
    }
}
