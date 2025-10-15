//
//  SongManager.swift
//  demo03
//
//  Created by 宋晓明 on 2025/9/18.
//

import Combine

class SongManager: ObservableObject {
    @Published private(set) var song: SongsModel = SongsModel(artist: "", audio_url: "", cover: "", title: "")
    
    func playSong(songModel: SongsModel) {
        song = songModel
    }
}
