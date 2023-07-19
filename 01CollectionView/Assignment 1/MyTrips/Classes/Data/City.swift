//
//  City.swift
//  MyTrips
//
//  Created by Mathias Aichinger on 22.03.20.
//  Copyright © 2020 EasySolutions GmbH. All rights reserved.
//

import UIKit

struct City : Codable, Identifiable {
    var id: String { return name }
    var name: String
    var country: String
    var continent: String
    var images: [String]
    
    var image: UIImage? {
        return UIImage(named: images[0])
    }
}
