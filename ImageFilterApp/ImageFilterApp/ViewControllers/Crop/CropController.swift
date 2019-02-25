//
//  CropController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/24.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit

class CropController: BaseViewController {
    
    let cropView: CropView = {
        return CropView()
    }()
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.addTarget(self, action: #selector(crop), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
        cropView.inputImage = self.originImage
    }
    
    private func setupLayout() {
        self.view.addSubview(self.button)
        self.view.addSubview(self.cropView)
        
        cropView.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.centerY.equalToSuperview()
            constraint.width.equalToSuperview()
            constraint.height.equalTo(500)
        }
        cropView.center = self.view.center
    }
    
    @objc func crop() {
        self.cropView.inputImage = cropView.crop()
    }
}
