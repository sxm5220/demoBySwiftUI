//
//  SearchPage.swift
//  demo03
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct SearchPage: View {
    
    @State var searchText: String = ""
    @State var sampleSortList = [SongsModel]()
    @EnvironmentObject var songManager: SongManager
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                
                TextField("Search",text: $searchText)
                    .onChange(of: searchText, perform: { value in
                        sampleSortList = sampleSongModel.filter({$0.title == searchText || $0.artist == searchText})
                    })
            }
            .padding()
            .background(.gray.opacity(0.2))
            .clipShape(Capsule())
            .padding(.horizontal)
            
            ScrollView{
                ForEach(sampleSortList) { item in
                    HStack(alignment: .top){
                        AsyncImage(url: URL(string: item.cover)) { img in
                            img.resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60,height: 60)
                        .clipShape(.rect(cornerRadius: 10))
                        
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
            .padding()
        }
    }
}

#Preview {
    SearchPage()
        .preferredColorScheme(.dark)
}
