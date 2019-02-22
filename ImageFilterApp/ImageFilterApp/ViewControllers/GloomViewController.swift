//
//  GloomViewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/22.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class GloomViewController: BaseViewController {

    var originImage: UIImage? = UIImage(named: "lena")
    
    let filter: ImageFilter = ImageFilter.sharedImageFilter
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let intensitySlider: UISlider = {
        let slider = UISlider()
        ///Range参照 https://qiita.com/shtnkgm/items/fb1425ef88d31fdad1d4#inputradius-14
        let radiusMaximumValue: Float = 100.00
        let radiusMinimumValue: Float = 0.00
        let radiusDefaultValue: Float = 10.00
        slider.maximumValue = radiusMaximumValue
        slider.minimumValue = radiusMinimumValue
        slider.value = radiusDefaultValue
        return slider
    }()
    
    private let radiusSlider: UISlider = {
        let slider = UISlider()
        ///Range参照 https://qiita.com/shtnkgm/items/fb1425ef88d31fdad1d4#inputintensity
        let intensityMaximumValue: Float = 1.00
        let intensityMinimumValue: Float = 0.00
        let intensityDefaultValue: Float = 0.50
        slider.maximumValue = intensityMaximumValue
        slider.minimumValue = intensityMinimumValue
        slider.value = intensityDefaultValue
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.intensitySlider)
        self.view.addSubview(self.radiusSlider)
        self.setupLayout()
        self.imageView.image = self.originImage
        self.intensitySlider.addTarget(self, action: #selector(didChangeSliderValue), for: .touchUpInside)
        self.radiusSlider.addTarget(self, action: #selector(didChangeSliderValue), for: .touchUpInside)
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
        self.imageView.snp.makeConstraints { (constraint) in
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
        let gloomFilter: CIFilter = CustomGloomFilter.filter(image: CIImage(image: image), radius: NSNumber(value: radiusValue), intensity: NSNumber(value: intensityValue))
        self.imageView.image = self.filter.createImage(filter: gloomFilter)
    }
}
