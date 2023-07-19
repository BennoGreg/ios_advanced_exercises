//
//  File.swift
//  CombineStarWars
//
//  Created by Benedikt Langer on 16.05.20.
//  Copyright © 2020 Benedikt. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct searchBarView: UIViewRepresentable {

    @Binding var text:String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>){
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    func makeCoordinator() -> searchBarView.Coordinator {
        return Coordinator(text: $text)
    }
    func makeUIView(context: UIViewRepresentableContext<searchBarView>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<searchBarView>) {
        uiView.text = text
    }
}
