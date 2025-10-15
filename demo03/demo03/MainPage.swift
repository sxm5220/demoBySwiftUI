//
//  ContentView.swift
//  demo03
//
//  Created by 宋晓明 on 2025/9/17.
//

import SwiftUI

struct MainPage: View {
    
    @State private var expandSheet = false
    @Namespace private var animation
    @StateObject var songManager = SongManager()
    
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .environmentObject(songManager)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
            SearchPage()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .environmentObject(songManager)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
            Text("playlists")
                .tabItem {
                    Image(systemName: "play.rectangle.on.rectangle")
                    Text("Playlists")
                }
                .environmentObject(songManager)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
        }
        .tint(.white)
        .safeAreaInset(edge: .bottom) {
            if !songManager.song.title.isEmpty {
                customBottomSheet()
            }
        }
        .overlay {
            if expandSheet {
                MusicPlayInfoPage(expandSheet: $expandSheet, animation: animation)
                    .environmentObject(songManager)
            }
        }
    }
    
    //自定义bottomsheet
    @ViewBuilder
    func customBottomSheet() -> some View {
        ZStack{
            if expandSheet {
                Rectangle()
                    .fill(.clear)
            }else{
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .overlay {
                        MusicPlayBottomSheetView(expandSheet: $expandSheet, animation: animation)
                            .environmentObject(songManager)
                    }
                    .clipShape(.rect(topLeadingRadius: 30,topTrailingRadius: 30))
                    .matchedGeometryEffect(id: "BACKGROUNDVIEW", in: animation)
            }
        }
        .frame(height: 80)
        .offset(y: -49)
    }
}

#Preview {
    MainPage()
        .preferredColorScheme(.dark)
}
