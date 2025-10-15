//
//  ArtistDetailsView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct ArtistDetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var albumArr: NSArray = [
        [
            "image":"ar_d_1",
            "name":"Fire Dragon",
            "year":"2019",
        ],
        [
            "image": "ar_d_2",
            "name": "Sound of Life",
            "year": "2018",
        ],
        [
            "image":"ar_d_3",
            "name":"Giving Heart",
            "year":"2017",
        ],
        [
            "image": "ar_d_4",
            "name": "Dream of",
            "year": "2016",
        ]
    ]
    
    @State var allArr: NSArray = [
        ["duration": "3:56", "name": "Billie Jean", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Earth Song", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"],
        ["duration": "3:56", "name": "Remember the Time","artists": "Michael Jackson"
        ],
        ["duration": "3:56", "name": "Billie Jean", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Earth Song", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"],
        ["duration": "3:56", "name": "Remember the Time","artists": "Michael Jackson"
        ],
        ["duration": "3:56", "name": "Billie Jean", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Earth Song", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"],
        ["duration": "3:56", "name": "Remember the Time","artists": "Michael Jackson"
        ]
    ]
    
    var sObj: NSDictionary = [:]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Text("Artist Details")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText80)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Image("search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primaryText28)
                    }
                }
                .padding(.top,.topInsets)
                .padding(.horizontal,20)
                
                ScrollView {
                    ZStack {
                        Image(sObj.value(forKey: "image") as? String ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: .screenWidth - 40, height: .screenWidth * 0.5)
                            .blur(radius: 5)
                            .clipped()
                        
                        Rectangle()
                            .fill( Color.black.opacity(0.54) )
                        
                        VStack {
                            VStack(spacing: 15) {
                                Text(sObj.value(forKey: "name") as? String ?? "")
                                    .font(.customfont(.bold, fontSize: 18))
                                    .foregroundColor(.primaryText.opacity(0.9))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Text(sObj.value(forKey: "intro") as? String ?? "")
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.primaryText.opacity(0.74))
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .padding(.bottom,25)
                            
                            HStack(alignment: .center) {
                                Spacer()
                               
                                VStack {
                                    Text(sObj.value(forKey: "followers") as? String ?? "")
                                        .font(.customfont(.bold, fontSize: 18))
                                        .foregroundColor(.primaryText.opacity(0.9))
                                    
                                    Text("Followers")
                                        .font(.customfont(.bold, fontSize: 10))
                                        .foregroundColor(.primaryText60)
                                }
                                
                                Spacer()
                                VStack {
                                    Text(sObj.value(forKey: "lintners") as? String ?? "")
                                        .font(.customfont(.bold, fontSize: 18))
                                        .foregroundColor(.primaryText.opacity(0.9))
                                    
                                    Text("Lintners")
                                        .font(.customfont(.bold, fontSize: 10))
                                        .foregroundColor(.primaryText60)
                                }
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text("Follow")
                                        .font(.customfont(.medium, fontSize: 8))
                                        .foregroundColor(.primaryText.opacity(0.74))
                                }
                                .padding(8)
                                .padding(.horizontal, 8)
                                .background(
                                    LinearGradient(colors: Color.primaryG, startPoint: .top, endPoint: .bottom)
                                )
                                .cornerRadius(15)
                            }
                        }
                        .padding(20)
                    }
                    .frame(width: .screenWidth - 40)
                    
                    ViewAllSection(title: "Top Albums") {
                        
                    }
                    .padding(20)
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach( 0..<albumArr.count, id: \.self) { index in
                                
                                let sObj = albumArr[index] as? NSDictionary ?? [:]
                                ArtistAlbumCell(sObj: sObj)
                            }
                            
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    ViewAllSection(title: "Top Songs") {
                        
                    }
                    .padding(20)
                    
                    LazyVStack {
                        ForEach( 0..<allArr.count , id: \.self) { index in
                            let sObj = allArr[index] as? NSDictionary ?? [:]
                            
                            AlbumSongRow(sObj: sObj, isPlay: index == 0)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

#Preview {
    ArtistDetailsView(sObj: [
        "image": "ar_6",
        "name": "Yani",
        "intro": "Pop rock, Funk pop, Heavy Metal",
        "followers": "4,357",
        "lintners": "128,980"
    ])
        .preferredColorScheme(.dark)
}
