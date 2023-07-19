//
//  Swapi.swift
//  CombineStarWars
//
//  Created by Benedikt Langer on 16.05.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import SwiftUI
import Combine

struct SearchResponse : Decodable{
    let results: [People]
}

struct People : Decodable, Identifiable{
    var id: String { return name}
    
    let name: String
    let gender: String
}

class SwapiPeopleSearch : ObservableObject {
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    let resultSubject = PassthroughSubject<[People], Never>()
    
    @Published var searchText: String = ""
    
    private var searchStream: Cancellable!
    
    init() {
       
        
        
        searchStream = $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .removeDuplicates()
            .map{(searchString) -> URL? in
            guard var searchUrl = URLComponents(string: "https://swapi.dev/api/people/?") else{
                return nil
            }
            searchUrl.queryItems = [URLQueryItem(name: "search", value: searchString)]
            return searchUrl.url
        }.flatMap{ (url) in
            return self.session.dataTaskPublisher(for: url!).map{$0.data}.map{ data in
                return data
            }.decode(type: SearchResponse.self, decoder: JSONDecoder()).map{$0.results}.catch{ error in
                    return Just([People]())
                }
        }.subscribe(self.resultSubject)
        
        
        
        
        
        
    }
}
