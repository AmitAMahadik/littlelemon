//
//  DetailItem.swift
//  Little Lemon Restaurant
//
//  Created by Mahadik, Amit on 2/10/24.
//

import SwiftUI

struct DetailItem: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(dish.title ?? "")
                .font(.subTitleFont())
                .foregroundColor(.primaryColor1)
            Spacer(minLength: 20)
            Text(dish.descriptionDish ?? "")
                .font(.regularText())
            Spacer(minLength: 10)
            if #available(iOS 16.0, *) {
                Text("$" + (dish.price ?? ""))
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            } else {
                // Fallback on earlier versions
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    DetailItem(dish: PersistenceController.oneDish())
}
