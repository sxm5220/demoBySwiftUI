//
//  AlbumDetailsView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct AlbumDetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                            .frame(width: 25,height: 25)
                    }
                    
                    Text("Album Details")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText80)
                        .frame(maxWidth: .infinity,alignment: .center)
                    
                    
                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Image("search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
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
                            .frame(width: .screenWidth - 40,height: .screenWidth * 0.5)
                            .blur(radius: 5)
                            .clipped()
                        
                        Rectangle()
                            .fill(Color.black.opacity(0.54))
                            .frame(height: .screenWidth * 0.5)
                        
                        VStack {
                            HStack(alignment: .top,spacing: 15) {
                                Image(sObj.value(forKey: "image") as? String ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100,height: 100)
                                    .clipped()
                                
                                VStack(spacing: 8) {
                                    Text(sObj.value(forKey: "name") as? String ?? "")
                                        .font(.customfont(.bold, fontSize: 18))
                                        .foregroundColor(.primaryText.opacity(0.9))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("by \(sObj.value(forKey: "artists") as? String ?? "")")
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundColor(.primaryText.opacity(0.74))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(sObj.value(forKey: "num") as? String ?? "")
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundColor(.primaryText.opacity(0.74))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image("play_n")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:12, height: 12)
                                    
                                    Text("Play")
                                        .font(.customfont(.medium, fontSize: 8))
                                        .foregroundColor(.primaryText.opacity(0.74))
                                }
                                .padding(8)
                                .padding(.horizontal, 8)
                                .background(
                                    LinearGradient(colors: Color.primaryG, startPoint: .top, endPoint: .bottom)
                                )
                                .cornerRadius(15)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image("share")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:12, height: 12)
                                    
                                    Text("Share")
                                        .font(.customfont(.medium, fontSize: 8))
                                        .foregroundColor(.primaryText.opacity(0.74))
                                }
                                .padding(8)
                                .padding(.horizontal, 15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke( Color.primaryText, lineWidth: 1 )
                                )
                                .cornerRadius(8)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image("favTemp")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:12, height: 12)
                                    
                                    Text("Add to Favorites")
                                        .font(.customfont(.medium, fontSize: 8))
                                        
                                }
                                .foregroundColor(.primaryText.opacity(0.74))
                                .padding(8)
                                .padding(.horizontal, 8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke( Color.primaryText, lineWidth: 1 )
                                )
                                .cornerRadius(15)
                            }
                        }
                        .padding(20)
                    }
                    .frame(width: .screenWidth - 40)
                    
                    LazyVStack {
                        ForEach(0..<allArr.count,id: \.self) { index in
                            let sObj = allArr[index] as? NSDictionary ?? [:]
                            
                            AlbumSongRow(sObj: sObj, isPlay: index == 0)
                        }
                    }
                    .padding(20)
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
    AlbumDetailsView(sObj: [
        "image": "alb_1",
        "name": "History",
        "artists": "Michael Jackson",
        "songs": "10 Songs",
        "num":"1996  .  18 Songs  .  64 min"
      ])
        .preferredColorScheme(.dark)
}
