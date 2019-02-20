//
//  FilterListViewController.swift
//  ImageFilterApp
//
//  Created by haruta yamada on 2019/02/20.
//  Copyright © 2019 teranyan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class FilterListViewController: BaseViewController {
    let preview: UIImageView = UIImageView()
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()
    lazy var listView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
