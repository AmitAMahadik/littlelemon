//
//  MainScreen.swift
//  Little Lemon Restaurant
//
//  Created by Mahadik, Amit on 2/10/24.
//

import SwiftUI

struct MainScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
       // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationStack {
            VStack {
                Header()
                Menu()
            }
        }
    }
}

#Preview {
    MainScreen()
}
