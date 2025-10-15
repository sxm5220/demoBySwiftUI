//
//  SongsModel.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import Foundation

struct ScrollTabModel: Identifiable {
    var id: UUID = .init()
    var index: Int
    var title: String
}

var scrollTabList = [
    ScrollTabModel(index: 0, title: "All Songs"),
    ScrollTabModel(index: 1, title: "Playlists"),
    ScrollTabModel(index: 2, title: "Albums"),
    ScrollTabModel(index: 3, title: "Artists"),
    ScrollTabModel(index: 4, title: "Genres"),
]
