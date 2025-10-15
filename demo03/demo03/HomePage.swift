//
//  Home.swift
//  demo03
//
//  Created by 宋晓明 on 2025/9/17.
//

import SwiftUI

struct HomePage: View {
    
    @State private var expandSheet = false
    @Namespace private var animation
    @EnvironmentObject var songManager: SongManager
    
    var body: some View {
        ScrollView{
            //header view
            buildHeaderView
            
            buildTagsView
            
            buildQuickPlayView
            
            buildLargeCardsView
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    
    var buildHeaderView: some View {
        GeometryReader { size in
            VStack(alignment: .leading) {
                HStack(spacing: 15){
                    Text("Good morning moods✨")
                    
                    Spacer()
                    
                    Image(systemName: "bell")
                        .imageScale(.large)
                    
                    Image("home4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, getSafeAreaTop())
        .background(LinearGradient(colors: [Color.red,Color.clear], startPoint: .top, endPoint: .bottom))
        .frame(maxWidth: .infinity)
        .frame(height: getSafeAreaTop() * 2)
        
    }
    
    var buildTagsView: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack {
                ForEach(sampleTagList,id: \.id) { item in
                    Text(item.tag)
                        .padding(.horizontal)
                        .padding(.vertical,10)
                        .background(RoundedRectangle(cornerRadius: 12).fill(.white.opacity(0.15)))
                }
            }
            .padding()
        }
    }
    
    var buildQuickPlayView: some View {
        VStack {
            HStack {
                Text("Quick Play")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(60)),GridItem(.fixed(60)),GridItem(.fixed(60)),GridItem(.fixed(60))]) {
                    ForEach(sampleSongModel,id:\.id){ item in
                        HStack(spacing: 20) {
                            AsyncImage(url: URL(string: item.cover)) { img in
                                img.resizable()
                                    .scaledToFill()
                            } placeholder:{
                                ProgressView()
                                    .background(.white.opacity(0.1))
                                    .clipShape(.rect(cornerRadius: 5))
                            }
                            .frame(width: 60,height: 60)
                            .clipShape(.rect(cornerRadius: 5))
                            
                            VStack(alignment: .leading) {
                                Text("\(item.title)")
                                    .font(.headline)
                                
                                Text("\(item.artist)")
                                    .font(.caption)
                            }
                            
                            Spacer()
                        }
                        .onTapGesture {
                            songManager.playSong(songModel: item)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    var buildLargeCardsView: some View {
        VStack{
            HStack{
                Text("New Releases")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 15) {
                    ForEach(sampleSongModel,id: \.id) { item in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string:item.cover)) { img in
                                img.resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 160,height: 160)
                            .clipShape(.rect(cornerRadius: 20))
                            
                            Text("\(item.title)")
                                .font(.headline)
                            
                            Text("\(item.artist)")
                                .font(.caption)
                            
                        }
                        .onTapGesture {
                            songManager.playSong(songModel: item)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func getSafeAreaTop() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        return keyWindow?.safeAreaInsets.top ?? 80
    }
}

#Preview {
    HomePage()
        .preferredColorScheme(.dark)
}
