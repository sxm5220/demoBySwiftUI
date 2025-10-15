//
//  ViewAllSection.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct ViewAllSection: View {
    
    @State var title: String = ""
    @State var btn: String = ""
    var didTap:(()->())?
    
    var body: some View {
        HStack{
            Text(title)
                .font(.customfont(.medium, fontSize: 15))
                .foregroundColor(.primaryText80)
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            Button {
                didTap?()
            } label: {
                Text(btn)
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundColor(.org)
            }
        }
    }
}

#Preview {
    ViewAllSection()
}
