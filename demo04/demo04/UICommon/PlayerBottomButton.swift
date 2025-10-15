//
//  PlayerBottomButton.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct PlayerBottomButton: View {
    var title: String = "Playlist"
    var icon: String = "playlist"
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.primaryText)
            
            Text(title)
                .font(.customfont(.regular, fontSize: 10))
                .foregroundColor(.secondaryText)
             
        }
    }
}

#Preview {
    PlayerBottomButton()
}
