//
//  Tourist.swift
//  MyTrips
//
//  Created by Benedikt Langer on 17.04.20.
//  Copyright © 2020 EasySolutions GmbH. All rights reserved.
//

import Foundation

class Tourist: NSObject {
    @objc dynamic var currentCity: String? = nil
    
    func goToCity(city: City){
        currentCity = city.name
    }
    
    func comeHome(){
        currentCity = nil
    }
}
