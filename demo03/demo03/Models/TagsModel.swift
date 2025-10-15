//
//  TagsModel.swift
//  demo03
//
//  Created by 宋晓明 on 2025/9/17.
//

import Foundation

struct TagsModel: Identifiable {
    var id: UUID = .init()
    var tag: String
}

var sampleTagList = [
    TagsModel(tag: "Romance"),
    TagsModel(tag: "Feel Good"),
    TagsModel(tag: "Podcasts"),
    TagsModel(tag: "Party"),
    TagsModel(tag: "Relax"),
    TagsModel(tag: "Commute"),
    TagsModel(tag: "Workout"),
    TagsModel(tag: "Sad"),
    TagsModel(tag: "Focus"),
]
