//
//  FoodItem.swift
//  Little Lemon Restaurant
//
//  Created by Mahadik, Amit on 2/10/24.
//

import SwiftUI

struct FoodItem: View {
    let dish:Dish
    
    var body: some View {
        HStack {
            VStack {
                Text(dish.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                Spacer(minLength: 10)
                Text(dish.descriptionDish ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                Spacer(minLength: 5)
                if #available(iOS 16.0, *) {
                    Text("$" + (dish.price ?? ""))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.highlightText())
                        .foregroundColor(.primaryColor1)
                        .monospaced()
                } else {
                    // Fallback on earlier versions
                }
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
    
}

#Preview {
    FoodItem(dish: PersistenceController.oneDish())
}
