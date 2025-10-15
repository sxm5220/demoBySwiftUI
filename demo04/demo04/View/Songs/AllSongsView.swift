//
//  AllSongsView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct AllSongsView: View {
    
    @State var allArr: NSArray = [
        [
            
            "image": "s1",
            "name": "Billie Jean",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s2",
            "name": "Be the girl",
            "artist": "Bebe Rexa"
        ],
        [
            "image": "s3",
            "name": "Countryman",
            "artist": "Daughtry"
        ],
        [
            "image": "s4",
            "name": "Do you feel lonelyness",
            "artist": "Marc Anthony"
        ],
        [
            "image": "s5",
            "name": "Earth song",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s6",
            "name": "Smooth criminal",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s7",
            "name": "The way you make me feel",
            "artist": "Michael Jackson"
        ],
        
        [
            "image": "s9",
            "name": "Somebody that I used to know",
            "artist": "Gotye"
        ],
        [
            "image": "s10",
            "name": "Wild Thoughts",
            "artist": "Michael Jackson"
        ]
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<allArr.count,id:\.self){ index in
                    let sObj = allArr[index] as? NSDictionary ?? [:]
                    NavigationLink{
                        MainPlayerView()
                    }label: {
                        AllSongRow(sObj: sObj)
                    }
                }
            }
            .padding(10)
        }
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

#Preview {
    AllSongsView()
}
