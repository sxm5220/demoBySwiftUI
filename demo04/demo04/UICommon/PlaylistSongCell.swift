//
//  PlaylistSongCell.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct PlaylistSongCell: View {
    var sObj: NSDictionary = [:]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: .infinity,height: .infinity)
            
            Rectangle()
                .fill(Color.black.opacity(0.45))
            
            HStack {
                VStack {
                    Text(sObj.value(forKey: "name") as? String ?? "")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    
                    Text(sObj.value(forKey: "songs") as? String ?? "")
                        .font(.customfont(.regular, fontSize: 10))
                        .foregroundColor(Color.primaryText28)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                }
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                
                Button {
                    
                } label: {
                    Image("play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22,height: 22)
                }

            }
            .padding(15)
        }
        .aspectRatio(CGSize(width: 200, height: 140),contentMode: .fit)
    }
}

#Preview {
    PlaylistSongCell(sObj: ["image":"playlist_1", "name":"My Top Tracks","songs":"100 Songs"])
        .preferredColorScheme(.dark)
}
