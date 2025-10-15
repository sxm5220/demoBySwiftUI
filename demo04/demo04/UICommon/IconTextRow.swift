//
//  IconTextRow.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct IconTextRow: View {
    var title: String = "Themes"
    var icon: String = "m_theme"
    
    var body: some View {
        VStack {
            HStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25,height: 25)
                
                Text(title)
                    .font(.customfont(.medium   , fontSize: 14))
                    .foregroundColor(Color.primaryText.opacity(0.9))
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            }
            .frame(height: 40)
            
            Divider()
                .padding(.leading,40)
        }
    }
}

#Preview {
    IconTextRow()
}
