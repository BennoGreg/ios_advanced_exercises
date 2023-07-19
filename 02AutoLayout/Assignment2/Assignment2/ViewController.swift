//
//  ViewController.swift
//  Assignment2
//
//  Created by Benedikt Langer on 03.04.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    @IBInspectable var customView = PhoneView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        self.view.addSubview(customView)
//        customView.snp.makeConstraints { (maker) in
//            maker.width.lessThanOrEqualTo(374)
//            maker.leading.trailing.equalTo(self.view)
//            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
//            maker.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
//        }
    }


}

