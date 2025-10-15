//
//  ArtistsView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct ArtistsView: View {
    @State var allArr: NSArray = [
        [
                      "image": "ar_1",
                      "name": "Beyonce",
                      "albums": "4 albums",
                      "songs": "38 Songs",
                      "intro": "Pop rock, Funk pop, Heavy Metal 1",
                      "followers": "4,357",
                      "lintners": "128,980"
                    ],
                    [
                      "image": "ar_2",
                      "name": "Bebe Rexha",
                      "albums": "2 albums",
                      "songs": "18 Songs",
                      "intro": "Pop rock, Funk pop, Heavy Metal 2",
                      "followers": "5,357",
                      "lintners": "228,980"
                    ],
                    [
                      "image": "ar_3",
                      "name": "Maroon 5",
                      "albums": "5 albums",
                      "songs": "46 Songs",
                      "intro": "Pop rock, Funk pop, Heavy Metal 3",
                      "followers": "6,357",
                      "lintners": "728,980"
                    ],
                    [
                      "image": "ar_4",
                      "name": "Michael Jackson",
                      "albums": "10 albums",
                      "songs": "112 Songs",
                      "intro": "Pop rock, Funk pop, Heavy Metal 4",
                      "followers": "7,357",
                      "lintners": "428,980"
                    ],
                    [
                      "image": "ar_5",
                      "name": "Queens",
                      "albums": "3 albums",
                      "songs": "32 Songs",
                      "intro": "Pop rock, Funk pop, Heavy Metal 5",
                      "followers": "8,357",
                      "lintners": "528,980"
                    ],
                    [
                      "image": "ar_6",
                      "name": "Yani",
                      "albums": "1 albums",
                      "songs": "13 Songs",
                      "intro": "Pop rock, Funk pop, Heavy Metal 6",
                      "followers": "9,357",
                      "lintners": "928,980"
                    ]
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(0..<allArr.count,id: \.self) { index in
                    let sObj = allArr[index] as? NSDictionary ?? [:]
                    NavigationLink{
                        ArtistDetailsView(sObj: sObj)
                    } label: {
                        ArtistCell(aObj: sObj)
                    }
                }
            }
            .padding(20)
        }
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

#Preview {
    ArtistsView()
}
