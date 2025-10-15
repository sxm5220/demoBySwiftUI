//
//  TabBtnModel.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import Foundation

struct TabBtnModel: Identifiable {
    var id: UUID = .init()
    var index: Int
    var title: String
    var icon: String
    var iconUnFocus: String
}

var tabBtnList = [
    TabBtnModel(index:0,title: "Home",icon: "home_tab",iconUnFocus: "home_tab_un"),
    TabBtnModel(index:1,title: "Songs",icon: "songs_tab",iconUnFocus: "songs_tab_un"),
    TabBtnModel(index:2,title: "Settings",icon: "setting_tab",iconUnFocus: "setting_tab_un")
]
