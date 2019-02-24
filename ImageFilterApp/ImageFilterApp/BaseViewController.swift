//
//  BaseViewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/20.
//  Copyright © 2019 teranyan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var originImage: UIImage? = UIImage(named: "widthImage")
    
    let filter: ImageFilter = ImageFilter.sharedImageFilter
    
    let backgroundView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.white
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = backgroundView
    }
}
