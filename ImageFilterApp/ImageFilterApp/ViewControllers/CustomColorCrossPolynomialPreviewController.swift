//
//  CustomColorCrossPolynomialPreviewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/26.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CustomColorCrossPolynomialPreviewController: BaseViewController {
    
    var redVector = CIVector(string: "[1 0 0 0 0 0 0 0 0 0]")
    var greenVector = CIVector(string: "[0 1 0 0 0 0 0 0 0 0]")
    var blueVector = CIVector(string: "[0 0 1 0 0 0 0 0 0 0]")
    var redArray:[Float] = [1,0,0,0,0,0,0,0,0,0]
    var blueArray:[Float] = [0,1,0,0,0,0,0,0,0,0]
    var greenArray:[Float] = [0,0,1,0,0,0,0,0,0,0]
    
    private let segumentControl: UISegmentedControl = {
        return UISegmentedControl(items: ["red", "blue", "green"])
    }()
    
    private let preview = UIImageView()
    private let slider_0: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_1: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_2: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_3: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_4: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_5: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_6: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_7: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_8: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    private let slider_9: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preview.image = originImage
        
        self.view.addSubview(segumentControl)
        self.view.addSubview(preview)
        self.view.addSubview(slider_0)
        self.view.addSubview(slider_1)
        self.view.addSubview(slider_2)
        self.view.addSubview(slider_3)
        self.view.addSubview(slider_4)
        self.view.addSubview(slider_5)
        self.view.addSubview(slider_6)
        self.view.addSubview(slider_7)
        self.view.addSubview(slider_8)
        self.view.addSubview(slider_9)
        self.segumentControl.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            constraint.leading.equalTo(50)
        }
        self.preview.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            constraint.leading.equalToSuperview().offset(20)
            constraint.height.equalTo(self.preview.snp.width)
        }
        self.slider_0.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.preview.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_1.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_0.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_2.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_1.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_3.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_2.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_4.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_3.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_5.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_4.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_6.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_5.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_7.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_6.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_8.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_7.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_9.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(self.slider_8.snp.bottom)
            constraint.leading.equalToSuperview().offset(20)
        }
        self.slider_0.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_1.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_2.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_3.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_4.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_5.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_6.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_7.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_8.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        self.slider_9.addTarget(self, action: #selector(didChangeColorValue(_:)), for: .valueChanged)
        
        self.segumentControl.addTarget(self, action: #selector(didChangeSegment), for: .valueChanged)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.slider_0.value = 1
        self.segumentControl.selectedSegmentIndex = 0
    }
    
    @objc private func didChangeSegment() {
        let array:[Float]
        switch self.segumentControl.selectedSegmentIndex {
        case 0:
            array = redArray
        case 1:
            array = greenArray
        case 2:
            array = blueArray
        default:
            fatalError()
        }
        self.slider_0.value = array[0]
        self.slider_1.value = array[1]
        self.slider_2.value = array[2]
        self.slider_3.value = array[3]
        self.slider_4.value = array[4]
        self.slider_5.value = array[5]
        self.slider_6.value = array[6]
        self.slider_7.value = array[7]
        self.slider_8.value = array[8]
        self.slider_9.value = array[9]
    }
    
    @objc private func didChangeColorValue(_ sender: UISlider){
        defer {
            self.updateImage()
        }
        switch self.segumentControl.selectedSegmentIndex {
        case 0:
            self.redArray = [slider_0.value, slider_1.value, slider_2.value, slider_2.value, slider_3.value, slider_4.value, slider_5.value, slider_6.value, slider_7.value, slider_8.value, slider_9.value]
            self.redVector = CIVector(string: "[\(slider_0.value) \(slider_1.value) \(slider_2.value) \(slider_3.value) \(slider_4.value) \(slider_5.value) \(slider_6.value) \(slider_7.value) \(slider_8.value) \(slider_9.value)]")
        case 1:
            self.greenArray = [slider_0.value, slider_1.value, slider_2.value, slider_2.value, slider_3.value, slider_4.value, slider_5.value, slider_6.value, slider_7.value, slider_8.value, slider_9.value]
            self.greenVector = CIVector(string: "[\(slider_0.value) \(slider_1.value) \(slider_2.value) \(slider_3.value) \(slider_4.value) \(slider_5.value) \(slider_6.value) \(slider_7.value) \(slider_8.value) \(slider_9.value)]")
        case 2:
            self.blueArray = [slider_0.value, slider_1.value, slider_2.value, slider_2.value, slider_3.value, slider_4.value, slider_5.value, slider_6.value, slider_7.value, slider_8.value, slider_9.value]
            self.blueVector = CIVector(string: "[\(slider_0.value) \(slider_1.value) \(slider_2.value) \(slider_3.value) \(slider_4.value) \(slider_5.value) \(slider_6.value) \(slider_7.value) \(slider_8.value) \(slider_9.value)]")
        default:
            return
        }
        
    }
    private func updateImage() {
        let image = CIImage(image: originImage!)
        guard let colorCrossPolynomialFilter = CIFilter(name: "CIColorCrossPolynomial") else {
            return
        }
        colorCrossPolynomialFilter.setValue(image, forKey: "inputImage")
        colorCrossPolynomialFilter.setValue(self.redVector, forKey: "inputRedCoefficients")
        colorCrossPolynomialFilter.setValue(self.greenVector, forKey: "inputGreenCoefficients")
        colorCrossPolynomialFilter.setValue(self.blueVector, forKey: "inputBlueCoefficients")
        self.preview.image = ImageFilter.sharedImageFilter.createImage(filter: colorCrossPolynomialFilter)
    }
}
