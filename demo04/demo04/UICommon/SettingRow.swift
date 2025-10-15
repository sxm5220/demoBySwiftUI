//
//  SettingRow.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct SettingRow: View {
    var title: String = "Title"
    var icon: String = "s_display"
    var body: some View {
        VStack{
            
            HStack(spacing: 15) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundColor(  .primaryText.opacity(0.9) )
                    .frame(maxWidth: .infinity, alignment: .leading )
            }
            
            Divider()
                .padding(.leading, 40)
        }
        .frame(height: 44)
    }
}

#Preview {
    SettingRow()
        .preferredColorScheme(.dark)
}
