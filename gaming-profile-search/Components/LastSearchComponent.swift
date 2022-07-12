//
//  LastSearchComponent.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 12/07/2022.
//

import SwiftUI

func getLogo(typeLogo: String?) -> String {
    if typeLogo == "minecraft" {
        return "MinecraftBackground"
    }
    
    if typeLogo == "steam" {
        return "SteamBackground"
    }
    
    return "XboxBackground"
}

struct LastSearchComponent: View {
    public var lastSearch: Search?
    
    var body: some View {
        if lastSearch != nil {
            
            ZStack(alignment: .topLeading) {
                Image(getLogo(typeLogo: lastSearch?.typeSearch))
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 140, alignment: .top)
                    .alignmentGuide(.bottom) { d in d[.bottom] + 20 }
                    .cornerRadius(20)
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("\(lastSearch?.value ?? "")")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        
                        Text("\(lastSearch?.searchedAt ?? "")")
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
        } else {
            ProgressView()
        }
    }
}

struct LastSearchComponent_Previews: PreviewProvider {
    static var previews: some View {
        LastSearchComponent()
            .previewDevice("iPhone 13")
            .previewLayout(.sizeThatFits)
    }
}
