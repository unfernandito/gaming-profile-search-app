//
//  CardElement.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import SwiftUI

struct CardElement : Identifiable {
    var id: String
    var name: String
    var background: String
    var textColor: Color
    var backgroundText: Color
    var backgroundColor: Color
}

struct CardElementComponent: View {
    public var element: CardElement
    public var onTapHandler: (_ storeID: String) -> Void
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(element.background)
                .resizable()
                .scaledToFill()
                .frame(alignment: .top)
                .cornerRadius(20)

            VStack {
                HStack(alignment: .bottom) {
                    Text(element.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(element.textColor)
                        .padding()

                    Spacer()
                }
                Spacer()
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(element.backgroundColor)
                        .opacity(10.0)
                        .frame(height: 40)
                        .cornerRadius(20, corners: [.bottomRight, .bottomLeft])

                    HStack(alignment: .center) {
                        Text("See Profile")
                            .foregroundColor(element.backgroundText)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding([.leading, .bottom], 10.0)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(element.backgroundText)
                            .frame(width: 24, height: 24, alignment: .leading)
                            .padding([.leading, .bottom], 10.0)
                    }
                }
            }
        }
        .onTapGesture {
            onTapHandler(element.id)
        }
        
        .scaledToFill()
    }
}

struct CardElementComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardElementComponent(element: CardElement(
            id: "minecraft",
            name: "Minecraft",
            background: "MinecraftBackground",
            textColor: Color("MinecraftTextColor"),
            backgroundText: Color("MinecraftTextColor"),
            backgroundColor: Color("MinecraftColor")
        ), onTapHandler: {storeID in 
            
        })
        .previewDevice("iPhone 13")
        .previewLayout(.sizeThatFits)
    }
}
