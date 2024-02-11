//
//  Header.swift
//  Little Lemon Restaurant
//
//  Created by Mahadik, Amit on 2/5/24.
//

import SwiftUI

struct Header: View {
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Logo")
                    HStack {
                        Spacer()
                        if isLoggedIn {
                           // NavigationLink(destination: UserProfile()){
                             Image("Profile")
                           // }
                        }
                    }
                }
            }
        }
       // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Header()
}
