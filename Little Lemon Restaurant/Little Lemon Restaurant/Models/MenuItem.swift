//
//  MenuItem.swift
//  Little Lemon Restaurant
//
//  Created by Mahadik, Amit on 2/10/24.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title: String
    let descriptionDish: String
    let price: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descriptionDish = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}