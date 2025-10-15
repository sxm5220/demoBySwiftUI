//
//  MyPlaylistCell.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct MyPlaylistCell: View {
    var sObj: NSDictionary = [:]
    
    var body: some View {
        VStack {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 90,height: 80)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.primaryText28,lineWidth: 1))
                .padding(.bottom,4)
            
            Text(sObj.value(forKey: "name") as? String ?? "")
                .font(.customfont(.medium, fontSize: 12))
                .lineLimit(1)
                .foregroundColor(.primaryText60)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
        }
        .frame(width: 90)
    }
}

#Preview {
    MyPlaylistCell(sObj: [
        "image": "mp_1",
        "name": "Queens Collection"
    ])
        .preferredColorScheme(.dark)
}
