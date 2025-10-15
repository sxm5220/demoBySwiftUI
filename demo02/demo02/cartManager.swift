//
//  cartManager.swift
//  demo02
//
//  Created by 宋晓明 on 2025/9/16.
//

import SwiftUI

class CartManager: ObservableObject{
    @Published private(set) var products: [ProductModel] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: ProductModel) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: ProductModel) {
        products = products.filter{ $0.id != product.id }
        total -= product.price
    }
}
