//
//  SearchView.swift
//  gaming-profile-search
//
//  Created by luis.betancourt on 11/07/2022.
//

import SwiftUI

struct SearchComponent: View {
    public var valueSearch: Binding<String>
    public var cleanup: () -> Void = {
    }
    public var submit: () -> Void = {
    }

    var body: some View {
        VStack {
            Text("Profile Search Input")
            TextField("Profile ID: ", text: valueSearch)
                .onSubmit {
                    submit()
                }
            Spacer()
        }
        .padding()
        .onDisappear {
            cleanup()
        }
        .navigationTitle("Search your profile: ")
    }
}

struct SearchComponent_Previews: PreviewProvider {
    @State static var valueSearch: String = ""
    
    static var previews: some View {
        SearchComponent(valueSearch: $valueSearch, cleanup: {
            valueSearch = ""
        })
    }
}
