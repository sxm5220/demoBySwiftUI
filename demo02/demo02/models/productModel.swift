//
//  productModel.swift
//  demo02
//
//  Created by 宋晓明 on 2025/9/16.
//

import SwiftUI

struct ProductModel: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

var productList = [
    ProductModel(name: "Good Source", category: "Archery", image: "image 1", color: .pink, price: 8),
    ProductModel(name: "Unreal Muffins", category: "Archery", image: "image 2",color: .yellow, price: 10),
    ProductModel(name: "Twister Chips", category: "Badminton", image: "image 3",color: .red, price: 18),
    ProductModel(name: "Twister Chips", category: "Badminton", image: "image 4",color: .green, price: 28),
    ProductModel(name: "Regular Nature", category: "Badminton", image: "image 5",color: .blue, price: 25),
    ProductModel(name: "Dark Russet", category: "Badminton", image: "image 6",color: .brown, price: 12),
    ProductModel(name: "Smiths Chips", category: "Badminton", image: "image 7",color: .orange, price: 5),
    ProductModel(name: "Deep River", category: "Badminton", image: "image 8",color: .purple, price: 10),
]

