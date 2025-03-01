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
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    ZStack {
                        Image("Logo")
                        HStack {
                            Spacer()
                            if isLoggedIn {
                                NavigationLink(destination: UserProfile()) {
                                    Image("Profile")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(maxHeight: 50)
                                        .clipShape(Circle())
                                        .padding(.trailing)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxHeight: 60)
            .padding(.bottom)
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                } else {
                    isLoggedIn = false
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    Header()
}
