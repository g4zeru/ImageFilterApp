//
//  LuminanceFilterPreviewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/22.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit
class LuminanceFilterPreviewController: BaseViewController {
    
    private let preview: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let LuminanceSlider: UISlider = {
        let slider = UISlider()
        /// Range参照　https://qiita.com/shtnkgm/items/fb1425ef88d31fdad1d4#inputsharpness
        ///　違うFilterのパラメーターのRangeではあるものの公式のDefault値が0.4なので0.0~1.0は妥当だと思う
        let LuminanceMaximumValue: Float = 1.00
        let LuminanceMinimumValue: Float = 0.00
        let LuminanceDefaultValue: Float = 0.40
        
        slider.maximumValue = LuminanceMaximumValue
        slider.minimumValue = LuminanceMinimumValue
        slider.value = LuminanceDefaultValue
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.preview)
        self.view.addSubview(self.LuminanceSlider)
        self.didChangeShapenLuminanceValue()
        self.LuminanceSlider.addTarget(self, action: #selector(didChangeShapenLuminanceValue), for: UIControl.Event.valueChanged)
        self.setupLayer()
    }
    
    private func setupLayer() {
        self.preview.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            constraint.leading.equalToSuperview()
            constraint.bottom.equalTo(self.LuminanceSlider.snp.top).offset(50)
        }
        self.LuminanceSlider.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.leading.equalToSuperview().offset(20)
            constraint.height.equalTo(50)
            constraint.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-100)
        }
    }
    
    @objc private func didChangeShapenLuminanceValue() {
        guard let image = self.originImage else {
            return
        }
        let luminanceFilter: CIFilter? = CustomSharpenLuminanceFilter.create(image: CIImage(image: image), sharpness: self.LuminanceSlider.value)
        self.preview.image = self.filter.createImage(filter: luminanceFilter)
    }
}
