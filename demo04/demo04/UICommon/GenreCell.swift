//
//  GenreCell.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct GenreCell: View {
    var pObj: NSDictionary = [:]
    var body: some View {
        ZStack(alignment: .center) {
            Image(pObj.value(forKey: "image") as? String ?? "" )
                .resizable()
                .scaledToFill()
            
            Rectangle()
                .fill( Color.black.opacity(0.87) )
            
            VStack{
                Text(pObj.value(forKey: "name") as? String ?? "" )
                    .font(.customfont(.bold, fontSize: 15))
                    .foregroundColor(.primaryText)
                
                Text(pObj.value(forKey: "songs") as? String ?? "" )
                    .font(.customfont(.regular, fontSize: 10))
                    .foregroundColor(.primaryText80)
            }
            .padding(8)
            
        }
        .frame(width: ( .screenWidth - 55 ) / 2, height: ( .screenWidth - 55 ) / 2 * 0.75  )
    }
}

#Preview {
    GenreCell(pObj: [
        "image": "gen_1",
        "name": "Classical",
        "songs": "56 Songs"
    ])
}
