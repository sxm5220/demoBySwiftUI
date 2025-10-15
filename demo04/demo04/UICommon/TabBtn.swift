//
//  TabBtn.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct TabBtn: View {
    @State var tabBtnModel: TabBtnModel
    var isSelect: Bool = false
    var didTap:(()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            VStack{
                Image( isSelect ? tabBtnModel.icon : tabBtnModel.iconUnFocus)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                
                Text(tabBtnModel.title)
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundColor(isSelect ? .focus : .unfocused)
            }
        }
    }
}

#Preview {
    TabBtn(tabBtnModel: tabBtnList[0])
}
