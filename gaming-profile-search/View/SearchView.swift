//
//  SearchView.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import SwiftUI

struct SearchView: View {
    @State var valueSearch : String = ""
    
    var body: some View {
        VStack{
            Text("Profile Search Input")
            Form {
                TextField("Profile ID: ", text: $valueSearch)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Search your profile: ")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
