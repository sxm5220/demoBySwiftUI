//
//  ArtistAlbumCell.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct ArtistAlbumCell: View {
    @State var sObj: NSDictionary = [:]
    var body: some View {
        VStack {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 80)
                .padding(.bottom, 4)
                .clipped()
                
            Text(sObj.value(forKey: "name") as? String ?? "")
                .font(.customfont(.bold, fontSize: 13))
                .foregroundColor(.primaryText60)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Text(sObj.value(forKey: "year") as? String ?? "")
                .font(.customfont(.bold, fontSize: 10))
                .foregroundColor(Color.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 90)
    }
}

#Preview {
    ArtistAlbumCell(sObj: [
        "image":"ar_d_1",
        "name":"Fire Dragon",
        "year":"2019",
    ])
        .preferredColorScheme(.dark)
}
