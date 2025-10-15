//
//  SongsModel.swift
//  demo03
//
//  Created by 宋晓明 on 2025/9/17.
//

import Foundation

struct SongsModel: Identifiable {
    var id: UUID = .init()
    var artist: String
    var audio_url: String
    var cover: String
    var title: String
    var isFavourite: Bool = false
}

var sampleSongModel = [
    SongsModel(artist: "Diljit Dosangh", audio_url: "", cover: "https://img.alicdn.com/imgextra/i3/2210898473009/O1CN01TTAgWE1Y6AoAKpJXV_!!2210898473009.jpg", title: "Lalkara"),
    SongsModel(artist: "Ammy Virk", audio_url: "", cover: "https://s1.aigei.com/src/img/jpg/88/883f9f9c8dfd4f8b99cc8abe8c997333.jpg?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:UvSsaPJ453FbKHB7XmV-aIOoww8=", title: "Ni Kude"),
    SongsModel(artist: "Jordan Sandhu", audio_url: "", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnbhJIPsOwsdXK-Wy6LTwBTfwO2fd17UjF2QG-VL8x1cXVXw3rGAmRWx0DJTAJSE2bk64&usqp=CAU", title: "Lalkara"),
    SongsModel(artist: "Lucas", audio_url: "", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZiMWFfaxMdw2LVA0qz_rFJaG6LPdxfU-9JAU57i8mxshxfQ2SyMuLHdmmT-ZMuBP-rtM&usqp=CAU", title: "Lalkara 2"),
    SongsModel(artist: "Jass Manak", audio_url: "", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEOHarRIt4gTyMPoH-6JAa8ktRB7VwhsvKdlP1YTzNEF-1EO4Iv-Lnpm0jfP80KwTWI4&usqp=CAU", title: "Ni Kude 2"),
    SongsModel(artist: "Harnoor & Gifty", audio_url: "", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnbhJIPsOwsdXK-Wy6LTwBTfwO2fd17UjF2QG-VL8x1cXVXw3rGAmRWx0DJTAJSE2bk64&usqp=CAU", title: "Lalkara 2"),
    SongsModel(artist: "Diljit Dosangh 3", audio_url: "", cover: "https://img.alicdn.com/imgextra/i3/2210898473009/O1CN01TTAgWE1Y6AoAKpJXV_!!2210898473009.jpg", title: "Lalkara 3"),
    SongsModel(artist: "Ammy Virk 3", audio_url: "", cover: "https://s1.aigei.com/src/img/jpg/88/883f9f9c8dfd4f8b99cc8abe8c997333.jpg?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:UvSsaPJ453FbKHB7XmV-aIOoww8=", title: "Ni Kude 3"),
    SongsModel(artist: "Jordan Sandhu 3", audio_url: "", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnbhJIPsOwsdXK-Wy6LTwBTfwO2fd17UjF2QG-VL8x1cXVXw3rGAmRWx0DJTAJSE2bk64&usqp=CAU", title: "Lalkara 3"),
    SongsModel(artist: "Lucas 3", audio_url: "", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZiMWFfaxMdw2LVA0qz_rFJaG6LPdxfU-9JAU57i8mxshxfQ2SyMuLHdmmT-ZMuBP-rtM&usqp=CAU", title: "Lalkara 3"),
    SongsModel(artist: "Jass Manak 3", audio_url: "", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEOHarRIt4gTyMPoH-6JAa8ktRB7VwhsvKdlP1YTzNEF-1EO4Iv-Lnpm0jfP80KwTWI4&usqp=CAU", title: "Ni Kude 3"),
    SongsModel(artist: "Harnoor & Gifty 3", audio_url: "", cover: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnbhJIPsOwsdXK-Wy6LTwBTfwO2fd17UjF2QG-VL8x1cXVXw3rGAmRWx0DJTAJSE2bk64&usqp=CAU", title: "Lalkara 3"),
]
