//
//  HomeView.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if homeViewModel.lastSearch?.value != nil {
                        LastSearchComponent(lastSearch: homeViewModel.lastSearch)
                        Divider()
                    }

                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(homeViewModel.listCardElements(), id: \.self.id) { element in
                            CardElementComponent(
                                element: element,
                                onTapHandler: { storeID in
                                    homeViewModel.setStoreID(storeID)
                                    homeViewModel.showViewInput.toggle()
                                })
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            .sheet(isPresented: $homeViewModel.showViewInput) {
                SearchComponent(
                    valueSearch: $homeViewModel.valueSearch,
                    cleanup: {
                        homeViewModel.clearSearchValue()
                        homeViewModel.profileActive.toggle()
                    },
                    submit: {
                        homeViewModel.makeSearch()
                        homeViewModel.profileActive.toggle()
                    }
                )
            }
            .navigationTitle("Gaming Profiles")
            .navigationBarTitleDisplayMode(.inline)
            .background(LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .bottom, endPoint: .top))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
