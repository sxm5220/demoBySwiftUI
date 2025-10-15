//
//  ScrollTabBtn.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct ScrollTabBtn: View {
    var title: String = "Title"
    var width: Double = 70
    var isSelect: Bool = true
    var didTap:(()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.medium, fontSize: 15))
                .foregroundColor(isSelect ? .focus : .primaryText80)
        }
        .frame(width: width)
    }
}

#Preview {
    ScrollTabBtn()
}
