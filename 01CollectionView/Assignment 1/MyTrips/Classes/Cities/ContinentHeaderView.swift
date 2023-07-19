//
//  ContinetHeaderView.swift
//  MyTrips
//
//  Created by Benedikt Langer on 27.03.20.
//  Copyright © 2020 EasySolutions GmbH. All rights reserved.
//

import UIKit

class ContinentHeaderView: UICollectionReusableView {
        
    
    @IBOutlet weak var continentLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func setCountLabel(numberOfCities: Int){
        countLabel.text = "Amount: \(numberOfCities)"
    }
}
