//
//  PlaylistsView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct PlaylistsView: View {
    
    @State var playlistArr: NSArray = [
        ["image":"playlist_1", "name":"My Top Tracks","songs":"100 Songs"],
        ["image": "playlist_2","name": "Latest Added","songs": "323 Songs"],
                [
                    "image": "playlist_3",
                    "name": "History",
                    "songs": "450 Songs"
               ],
                [
                    "image": "playlist_4",
                    "name": "Favorites",
                    "songs": "966 Songs"
               ]
    ]
    
    @State var myPlaylistArr: NSArray = [
        [
                    "image": "mp_1",
                    "name": "Queens Collection"
                ],
                [
                    "image": "mp_2",
                    "name": "Rihanna Collection"
                ],
                [
                    "image": "mp_3",
                    "name": "MJ Collection"
                ],
                [
                    "image": "mp_4",
                    "name": "Classical Collection"
                ]
    ]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(),spacing: 0),GridItem(.flexible(),spacing: 0)],spacing: 0) {
                    ForEach(0..<playlistArr.count,id:\.self){ index in
                        let sObj = playlistArr[index] as? NSDictionary ?? [:]
                        PlaylistSongCell(sObj: sObj)
                    }
                }
                .padding(.vertical,15)
                
                ViewAllSection(title: "My Playlists"){
                    
                }
                .padding(.horizontal,15)
                .padding(.vertical,8)
                
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack(spacing: 15) {
                        ForEach(0..<myPlaylistArr.count,id: \.self){ index in
                            let sObj = myPlaylistArr[index] as? NSDictionary ?? [:]
                            MyPlaylistCell(sObj: sObj)
                        }
                    }
                    .padding(.horizontal,20)
                }
            }
            
            Button {
                
            } label: {
                Image("add")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25,height: 25)
            }
            .frame(width: 70,height: 70)
            .background(Color(hex: "23273B"))
            .cornerRadius(35)
            .shadow(radius: 5)
            .padding(30)
        }
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

#Preview {
    PlaylistsView()
        .preferredColorScheme(.dark)
}
