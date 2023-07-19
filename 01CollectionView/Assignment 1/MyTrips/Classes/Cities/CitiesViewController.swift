//
//  FirstViewController.swift
//  MyTrips
//
//  Created by Mathias Aichinger on 21.03.20.
//  Copyright © 2020 EasySolutions GmbH. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let collectionCities = cities
    var continents: [String] = []
    var multiArray: [[City]] = [[]]
    var kind: String = ""
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        continents = getContinents(cityArray: collectionCities)
        multiArray = getFinalData(continents: continents, cityArray: collectionCities)
    }
    
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let randContinent = 0
        let randCity = Int.random(in: 0..<multiArray[randContinent].count)
        let addCity = getNewCity(continent: randContinent, cityIndex: randCity, cityArray: multiArray)
        collectionView.performBatchUpdates({
            let indexPath = IndexPath(row: randCity, section: 0)
            multiArray[randContinent].insert(addCity, at: randCity+1)
            collectionView.insertItems(at: [indexPath])
            if let header = collectionView.supplementaryView(forElementKind: kind, at: IndexPath(item: 0, section: randContinent)) as? ContinentHeaderView{
                header.setCountLabel(numberOfCities: multiArray[randContinent].count)
            }
            
        }, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected \(indexPath.row)")
        performSegue(withIdentifier: SegueIdentifier.toDetail.rawValue, sender: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return multiArray[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return continents.count
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.cityCell.rawValue, for: indexPath) as! CityCollectionViewCell
        let city = multiArray[indexPath.section][indexPath.row]
        cell.updateContent(image: city.image, name: city.name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView
        .elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "continentHeader", for: indexPath) as! ContinentHeaderView
            let headerData = continents[indexPath.section]
            let numberOfCities = multiArray[indexPath.section].count
            header.setCountLabel(numberOfCities: numberOfCities)
            header.continentLabel.text = headerData
            self.kind = kind
            return header
           
        }
        return UICollectionReusableView()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.toDetail.rawValue {
            if let detailsVC = segue.destination as? CityDetailViewController {
                if let indexPath = sender as? IndexPath{
                    detailsVC.city = multiArray[indexPath.section][indexPath.row]
                }
            }
        }
    }
    
    
}

enum SegueIdentifier: String {
    case toDetail = "showDetail"
}

enum CellIdentifiers: String {
    case cityCell = "citiesCell"
}


