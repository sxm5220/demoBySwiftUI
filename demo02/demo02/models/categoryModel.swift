//
//  CategaryModel.swift
//  demo02
//
//  Created by 宋晓明 on 2025/9/16.
//

import Foundation

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "figure.archery", title: "Archery"),
    CategoryModel(icon: "figure.badminton", title: "Badminton"),
    CategoryModel(icon: "figure.american.football", title: "Football"),
]
