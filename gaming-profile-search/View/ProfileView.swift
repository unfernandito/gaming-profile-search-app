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
            VStack {
                Text("Profile View")
            }
            .navigationTitle("Your profile")
        } else {
            ProgressView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
