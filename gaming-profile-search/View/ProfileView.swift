//
//  ProfileView.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import SwiftUI

struct ProfileView: View {
    public var profile: ApiResponse?

    var body: some View {
        if profile != nil {
            let profileSafe = profile?.data?.player!
            
            ZStack {
                VStack {
                    AsyncImage(url: URL(string: profileSafe!.avatar)) { image in
                        image.resizable()
                    }
                    placeholder: {
                        ProgressView()
                    }
                    .frame(width: .infinity, height: 240, alignment: .center)
                    
                    ZStack {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .bottom, endPoint: .top))
                            .padding([.leading, .bottom], 10.0)
                        
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(profileSafe!.username)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.heavy)
                                Divider()
                                Text(profileSafe!.id)
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .fontWeight(.light)
                            }
                            
                            Spacer()
                            
                            Circle()
                                .fill(.red)
                                .frame(width: 64, height: 64, alignment: .center)
                        }
                    }
                    .frame(width: .infinity, height: 120)
                }
            }
            .padding()
            .navigationTitle("\(profileSafe!.username)")
        } else {
            ProgressView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: ApiResponse(
            code: "player.found",
          message: "Successfully found player by given ID.",
          data: DataPlayer(player: PlayerResponse(
            id: "76561198154754099",
            username: "NanD0", avatar: "https://avatars.akamai.steamstatic.com/6e5d56d282cd1cc21e3c8a46808c7521b99c4d5a_full.jpg")),
            success: true,
            error: false
        ))
            .previewDevice("iPhone 13")
            .previewLayout(.sizeThatFits)
    }
}
