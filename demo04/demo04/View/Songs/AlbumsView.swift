//
//  AlbumsView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct AlbumsView: View {
    @State var allArr: NSArray = [
        [
              "image": "alb_1",
              "name": "History",
              "artists": "Michael Jackson",
              "songs": "10 Songs",
              "num":"1998  .  12 Songs  .  44 min"
            ],
            [
              "image": "alb_2",
              "name": "Thriller",
              "artists": "Michael Jackson",
              "songs": "10 Songs",
              "num":"1999  .  12 Songs  .  45 min"
            ],
            [
              "image": "alb_3",
              "name": "It Won't Be Soon. . ",
              "artists": "Maroon 5",
              "songs": "10 Songs",
              "num":"1998  .  12 Songs  .  44 min"
            ],
            [
              "image": "alb_4",
              "name": "I Am... Yours",
              "artists": "Beyonce",
              "songs": "10 Songs",
              "num":"1999  .  12 Songs  .  45 min"
            ],
            [
              "image": "alb_5",
              "name": "Earth song",
              "artists": "Michael Jackson",
              "songs": "10 Songs",
              "num":"1998  .  12 Songs  .  44 min"
            ],
            [
              "image": "alb_6",
              "name": "Smooth criminal",
              "artists": "Michael Jackson",
              "songs": "10 Songs",
              "num":"1999  .  12 Songs  .  45 min"
            ]
    ]
    
    var columnGrid = [GridItem(.flexible(),spacing: 15),GridItem(.flexible(),spacing: 15)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnGrid,spacing: 15) {
                ForEach(0..<allArr.count,id: \.self) { index in
                    let sObj = allArr[index] as? NSDictionary ?? [:]
                    NavigationLink{
                        AlbumDetailsView(sObj: sObj)
                    } label: {
                        AlbumCell(sObj: sObj)
                    }
                }
            }
            .padding(15)
        }
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

#Preview {
    AlbumsView()
}
