//
//  CityCollectionViewCell.swift
//  MyTrips
//
//  Created by Benedikt Langer on 27.03.20.
//  Copyright © 2020 EasySolutions GmbH. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityImageView: UIImageView!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    func updateContent(image: UIImage?, name: String?){
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        cityImageView.image = image
        cityNameLabel.text = name
    }
}
