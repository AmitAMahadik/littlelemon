//
//  Little_Lemon_RestaurantApp.swift
//  Little Lemon Restaurant
//
//  Created by Mahadik, Amit on 2/5/24.
//

import SwiftUI

@main
struct Little_Lemon_RestaurantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
