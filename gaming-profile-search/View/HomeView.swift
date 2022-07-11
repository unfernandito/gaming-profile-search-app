//
//  HomeView.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import SwiftUI

let elements = [
    CardElement(
        name: "Minecraft",
        background: "MinecraftBackground",
        textColor: Color("MinecraftTextColor"),
        backgroundText: Color("MinecraftTextColor"),
        backgroundColor: Color("MinecraftColor")
    ),
    CardElement(
        name: "Steam",
        background: "SteamBackground",
        textColor: Color.white,
        backgroundText: Color.black,
        backgroundColor: Color.white
    ),
    CardElement(
        name: "Xbox",
        background: "XboxBackground",
        textColor: Color.white,
        backgroundText: Color.white,
        backgroundColor: Color("XboxColor")
    ),
]

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    @State var searchValue : String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if homeViewModel.lastSearch?.value != nil {
                        ZStack(alignment: .topLeading){
                            Rectangle()
                                .fill( LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(10)
                            
                            HStack(alignment: .center){
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 72, height: 72)
                                
                                VStack(alignment: .leading){
                                    Text("Last Search")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.white)
                                    
                                    Text("Profile name")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.white)
                                    
                                    Spacer()
                                }
                                Spacer()
                            }
                            .padding()
                        }
                        .padding()
                            
                        Divider()
                    }
                   
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(elements, id: \.self.name) { element in
                            CardElementComponent(element: element)
                        }
                        Spacer()
                    }
                    .padding()
                }
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


