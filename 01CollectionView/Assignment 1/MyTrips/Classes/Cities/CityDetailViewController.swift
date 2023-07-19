//
//  CityDetailViewController.swift
//  MyTrips
//
//  Created by Mathias Aichinger on 22.03.20.
//  Copyright © 2020 EasySolutions GmbH. All rights reserved.
//

import UIKit
import MapKit

class CityDetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityImageView: UIImageView!
    
    var city: City?
    var tourist: Tourist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let city = self.city {
            nameLabel.text = city.name
            cityImageView.image = city.image
            cityImageView.clipsToBounds = true
            cityImageView.layer.cornerRadius = cityImageView.frame.width/2
        }
        
        self.tourist = Tourist()
        
        self.tourist?.addObserver(self, forKeyPath: "currentCity", options: NSKeyValueObservingOptions([.initial, .new]), context: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {[weak self] in
            if let strongSelf = self {
                strongSelf.tourist?.goToCity(city: strongSelf.city!)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {[weak self] in
            if let strongSelf = self {
                strongSelf.tourist?.comeHome()
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if self.tourist?.currentCity ?? "" == self.city?.name{
            self.view.backgroundColor = .red
        }else{
            self.view.backgroundColor = .white
        }
    }
}
