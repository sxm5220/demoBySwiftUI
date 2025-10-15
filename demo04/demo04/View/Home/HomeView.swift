//
//  HomeView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var mainVM = MainViewModel.share
    
    @State var txtSearch: String = ""
    @State var hostRecommendedArr = [
        [
            "image": "img_1",
            "name": "Sound of Sky",
            "artists": "Dilon Bruce"
        ],
        [
            "image": "img_2",
            "name": "Girl on Fire",
            "artists": "Alecia Keys"
        ]
    ]
    
    @State var playlistArr = [
        [
                    "image": "img_3",
                    "name": "Classic Playlist",
                    "artists": "Piano Guys"
                ],
                [
                    "image": "img_4",
                    "name": "Summer Playlist",
                    "artists": "Dilon Bruce"
                ],
                [
                    "image": "img_5",
                    "name": "Pop Music",
                    "artists": "Michael Jackson"
                ]
            ]

    @State var recentlyPlayedArr = [
                [
                    "rate": "4",
                    "name": "Billie Jean",
                    "artists": "Michael Jackson"
                ],
                [
                    "rate": "4",
                    "name": "Earth Song",
                    "artists": "Michael Jackson"
                ],
                [
                    "rate": "4",
                    "name": "Mirror",
                    "artists": "Justin Timberlake"
                ],
                [
                    "rate": "4",
                    "name": "Remember the Time",
                    "artists": "Michael Jackson"
                ]
    ]
    
    var body: some View {
         
            VStack(alignment: .leading) {
                
                HStack(spacing: 15){
                    Button {
                        mainVM.isShowMenu = true
                    } label: {
                        Image("menu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                    }
                    
                    HStack{
                        Image("search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                            .foregroundColor(.primaryText28)
                        
                        TextField("Search Album Songs", text: $txtSearch)
                            .frame(minWidth: 0,maxWidth: .infinity)
                            .foregroundColor(.primaryText)
                    }
                    .padding(.horizontal,15)
                    .padding(.vertical,8)
                    .background(Color(hex: "292E4B"))
                    .clipShape(Capsule())
                    
                }
                .padding(.top,.topInsets)
                .padding(.horizontal,20)
                
                
                ScrollView {
                    //Hot Recommended
                    VStack {
                        Text("Hot Recommended")
                            .font(.customfont(.medium, fontSize: 20))
                            .foregroundColor(.primaryText80)
                            .padding(.horizontal,20)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            LazyHStack(spacing: 15) {
                                ForEach(hostRecommendedArr,id: \.self) { item in
                                    VStack {
                                        Image(item["image"] ?? "")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 230, height: 125)
                                            .padding(.bottom,4)
                                        
                                        Text(item["name"] ?? "")
                                            .font(.customfont(.bold, fontSize: 13))
                                            .foregroundColor(.primaryText60)
                                            .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                        
                                        Text(item["artists"] ?? "")
                                            .font(.customfont(.bold, fontSize: 13))
                                            .foregroundColor(.secondaryText)
                                            .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                        
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,20)
                    }
                    
                    //Playlists
                    ViewAllSection(title: "Playlists",btn: "View All"){
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,8)
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(playlistArr,id: \.self) { item in
                                VStack {
                                    Image(item["image"] ?? "")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 110, height: 110)
                                        .padding(.bottom,4)
                                    
                                    Text(item["name"] ?? "")
                                        .font(.customfont(.bold, fontSize: 13))
                                        .foregroundColor(.primaryText60)
                                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                    
                                    Text(item["artists"] ?? "")
                                        .font(.customfont(.bold, fontSize: 13))
                                        .foregroundColor(.secondaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                    
                                }
                            }
                        }
                    }
                    .padding(.horizontal,20)
                    
                    //Recently Played
                    ViewAllSection(title: "Recently Played",btn: "View All"){
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,8)
                    
                    LazyVStack(spacing: 10) {
                        ForEach(recentlyPlayedArr, id: \.self) { item in
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image("play_btn")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25,height: 25)
                                }
                                
                                VStack{
                                    Text(item["name"] ?? "")
                                        .font(.customfont(.bold, fontSize: 13))
                                        .foregroundColor(.primaryText60)
                                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                    
                                    Text(item["artists"] ?? "")
                                        .font(.customfont(.bold, fontSize: 13))
                                        .foregroundColor(.secondaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                }
                                
                                VStack{
                                    Image("fav")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 12, height: 12)
                                    
                                    HStack(spacing: 2) {
                                        ForEach(1...5,id: \.self) { index in
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 12, height: 12)
                                                .foregroundColor(.org)
                                        }
                                    }
                                }
                            }
                            
                            Divider()
                                .padding(.leading,60)
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,8)
                    
                }
                .edgesIgnoringSafeArea(.top)
            }
            .frame(width: .screenWidth,height: .screenHeight)
            .background(Color.bg)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
