//
//  HomeViewModel.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import SwiftUI

let elements = [
    CardElement(
        id: "minecraft",
        name: "Minecraft",
        background: "MinecraftBackground",
        textColor: Color("MinecraftTextColor"),
        backgroundText: Color("MinecraftTextColor"),
        backgroundColor: Color("MinecraftColor")
    ),
    CardElement(
        id: "steam",
        name: "Steam",
        background: "SteamBackground",
        textColor: Color.white,
        backgroundText: Color.black,
        backgroundColor: Color.white
    ),
    CardElement(
        id: "xbox",
        name: "Xbox",
        background: "XboxBackground",
        textColor: Color.white,
        backgroundText: Color.white,
        backgroundColor: Color("XboxColor")
    )
]

let URL_API = "https://playerdb.co/api/player/"

extension HomeView {
    @MainActor class HomeViewModel: ObservableObject {
        @Published private(set) var lastSearch: Search?
        @Published private(set) var storeID: String = ""
        @Published var showViewInput: Bool = false
        @Published var profileActive: Bool = false
        @Published var valueSearch: String = ""
        @Published var profileData: ApiResponse?

        func loadProfileData(completion:@escaping (ApiResponse) -> Void) {
            guard let url = URL(string: "\(URL_API)\(storeID)/\(valueSearch)") else {
                print("Invalid URL!")
                return
            }
            
            URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                let profileData = try! JSONDecoder().decode(ApiResponse.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(profileData)
                }
            }).resume()
        }
        
        func makeSearch() {
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateUnix: String = format.string(from: Date())
            
            if ["minecraft", "steam", "xbox"].contains(storeID) {
                loadProfileData(completion: { profileDataResponse in
                    self.profileData = profileDataResponse
                })
            }
            
            lastSearch = Search(
                value: valueSearch,
                typeSearch: storeID,
                searchedAt: dateUnix
            )
        }
        
        func setStoreID(_ store: String) {
            storeID = store
        }
        
        func clearSearchValue() {
            valueSearch = ""
        }
        
        func listCardElements() -> [CardElement] {
            return elements
        }
    }
}
