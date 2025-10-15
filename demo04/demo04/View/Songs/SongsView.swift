//
//  SongsView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct SongsView: View {
    
    @StateObject var mainVM = MainViewModel.share
    @State var selectTab: Int = 0
    
    var body: some View {
        ZStack {
            VStack{
                HStack(spacing: 15){
                    Button {
                        mainVM.isShowMenu = true
                    } label: {
                        Image("menu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                    }
                    
                    Spacer()
                    Text("Songs")
                        .font(.customfont(.medium, fontSize: 20))
                        .foregroundColor(.primaryText80)
                        .padding(.horizontal,20)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .center)
                    
                    
                    Spacer()
                    
                    Button {
                        
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
                
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal,showsIndicators: false) {
                        ZStack(alignment: .bottomLeading){
                            HStack(spacing: 15){
                                ForEach(scrollTabList,id: \.id){ item in
                                    ScrollTabBtn(title: item.title,isSelect: selectTab == item.index){
                                        withAnimation {
                                            scrollView.scrollTo(item.index,anchor: .center)
                                            selectTab = item.index
                                        }
                                    }
                                    .id(item.index)
                                }
                            }
                            .padding(.horizontal,20)
                            .padding(.bottom,10)
                            
                            Rectangle()
                                .fill(Color.focus)
                                .frame(width: 50,height: 2,alignment: .leading)
                                .padding(.leading,(CGFloat(selectTab) * (70 + 15) + 30))
                        }
                    }
                    .onChange(of: selectTab) { _ in
                        withAnimation {
                            scrollView.scrollTo(selectTab,anchor: .center)
                        }
                    }
                }
                .frame(height: 25)
                .background(Color.bg)
                
                TabView(selection: $selectTab) {
                    AllSongsView()
                        .tag(0)
                    
                    PlaylistsView()
                        .tag(1)
                    
                    AlbumsView()
                        .tag(2)
                    
                    ArtistsView()
                        .tag(3)
                    
                    GenresView()
                        .tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.bottom,.bottomInsets + 40)
            }
        }
        .onAppear{
            UITabBar.appearance().isHidden = true
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
    SongsView()
}
