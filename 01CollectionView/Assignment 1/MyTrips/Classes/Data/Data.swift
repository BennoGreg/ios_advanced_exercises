//
//  Data.swift
//  HelloSwiftUI
//
//  Created by Wolfgang Damm on 12.06.19.
//  Copyright © 2019 Wolfgang Damm. All rights reserved.
//

import Foundation

let cities: [City] = load("cities.json")

func getContinents(cityArray: [City]) -> [String]{
    var continents: [String] = []
    for city in cityArray{
        if !continents.contains(city.continent){
            continents.append(city.continent)
        }
    }
    return continents
}

func getFinalData(continents: [String], cityArray: [City]) -> [[City]]{
    var multiArray = [[City]]()
    for _ in continents{
        multiArray.append([City]())
    }
    for city in cityArray{
        if let continentID = continents.firstIndex(of: city.continent) {
            multiArray[continentID].append(city)
        }
    }
    return multiArray
}

func getNewCity(continent: Int, cityIndex: Int, cityArray: [[City]]) -> City{
    return cityArray[continent][cityIndex]
}

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        let chars = try decoder.decode(T.self, from: data)
        return chars
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
