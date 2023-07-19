//
//  ContentView.swift
//  CombineStarWars
//
//  Created by Benedikt Langer on 16.05.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var swapiSearch = SwapiPeopleSearch()
    
    @State var people: [People] = []
    
    @State var returnSearch: AnyCancellable?
    
    
    
    var body: some View {
        VStack{
            HStack{
                
                searchBarView(text: $swapiSearch.searchText)
                 
            }.padding(.horizontal)
            List(people){character in
                HStack{
                    Text(character.name)
                    Spacer()
                    Text(character.gender).font(.subheadline)
                }
            }.onAppear(){
                self.returnSearch = self.swapiSearch.resultSubject.map{(people) -> [People] in
                    return people
                }.assign(to: \.people, on: self)
            }.animation(.easeIn)
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

