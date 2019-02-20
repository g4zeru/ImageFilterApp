//
//  ViewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/20.
//  Copyright © 2019 teranyan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {
    
    let imageView: UIImageView = UIImageView()
    let imageFilter = ImageFilter.sharedImageFilter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.centerY.equalToSuperview().offset(50)
            constraint.width.equalToSuperview().multipliedBy(0.7)
            constraint.height.equalTo(imageView.snp.width).multipliedBy(1)
        }
        guard let image = UIImage(named: "model") else {
            return
        }
        imageView.image = imageFilter.filter(image: image, index: 14)
        // Do any additional setup after loading the view, typically from a nib.
    }
}

