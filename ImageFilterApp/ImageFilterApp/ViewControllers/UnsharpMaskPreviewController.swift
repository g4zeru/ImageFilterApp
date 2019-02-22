//
//  UnsharpMaskPreviewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/22.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class UnsharpMaskPreviewController: BaseViewController {
    private let preview: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let intensitySlider: UISlider = {
        let slider = UISlider()
        ///Range参照 https://qiita.com/shtnkgm/items/fb1425ef88d31fdad1d4#inputintensity-6
        let intensityMaximumValue: Float = 1.00
        let intensityMinimumValue: Float = 0.00
        let intensityDefaultValue: Float = 0.50
        slider.maximumValue = intensityMaximumValue
        slider.minimumValue = intensityMinimumValue
        slider.value = intensityDefaultValue
        return slider
    }()
    private let radiusSlider: UISlider = {
        let slider = UISlider()
        ///Range参照 https://qiita.com/shtnkgm/items/fb1425ef88d31fdad1d4#inputradius-35
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
        self.view.addSubview(self.intensitySlider)
        self.view.addSubview(self.radiusSlider)
        self.setupLayout()
        didChangeSliderValue()
        self.intensitySlider.addTarget(self, action: #selector(didChangeSliderValue), for: .valueChanged)
        self.radiusSlider.addTarget(self, action: #selector(didChangeSliderValue), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    private func setupLayout() {
        self.radiusSlider.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.height.equalTo(50)
            constraint.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.intensitySlider.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.height.equalTo(50)
            constraint.bottom.equalTo(self.radiusSlider.snp.top).offset(-50)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.preview.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.leading.equalToSuperview().offset(10)
            constraint.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            constraint.bottom.equalTo(self.intensitySlider.snp.top).offset(-20)
        }
    }
    
    @objc private func didChangeSliderValue() {
        let radiusValue = self.radiusSlider.value
        let intensityValue = self.intensitySlider.value
        guard let image = self.originImage else {
            return
        }
        let unsharpMaskFilter: CIFilter = CustomUnsharpMaskFilter.create(image: CIImage(image: image), radius: NSNumber(value: radiusValue), intensity: NSNumber(value: intensityValue))
        self.preview.image = self.filter.createImage(filter: unsharpMaskFilter)
    }
}
