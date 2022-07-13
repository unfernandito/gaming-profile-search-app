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
                        NavigationLink(
                            destination: ProfileView(profile: homeViewModel.profileData),
                            label: {
                                LastSearchComponent(lastSearch: homeViewModel.lastSearch)
                            }
                        )
                        
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
                    
                    NavigationLink(destination: ProfileView(profile: homeViewModel.profileData),
                                   isActive: $homeViewModel.profileActive,
                    label: {
                        EmptyView()
                    })
                }
            }
            .sheet(isPresented: $homeViewModel.showViewInput) {
                SearchComponent(
                    valueSearch: $homeViewModel.valueSearch,
                    cleanup: {
                        homeViewModel.clearSearchValue()
                    },
                    submit: {
                        homeViewModel.makeSearch()
                        homeViewModel.showViewInput.toggle()
                        homeViewModel.profileActive.toggle()
                        homeViewModel.clearSearchValue()
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
            .previewDevice("iPhone 13")
            .previewLayout(.sizeThatFits)
    }
}
