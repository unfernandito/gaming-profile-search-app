//
//  HomeViewModel.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import Foundation

extension HomeView {
    @MainActor class HomeViewModel: ObservableObject {
        @Published private(set) var lastSearch : Search?
        
        func makeSearch(valueSearch: String) -> Void {
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            lastSearch = Search(
                value: valueSearch,
                searchedAt: Int(format.string(from: Date()))
            )
        }
    }
}
