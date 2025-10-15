//
//  MainTabView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var mainVM = MainViewModel.share
    
    var body: some View {
        NavigationView {
            ZStack {
                buildBodyView
                
                buildBottomView
                
                SideMenuView(isShowing: $mainVM.isShowMenu)
            }
            .frame(width: .screenWidth,height: .screenHeight)
            .background(Color.bg)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
    
    var buildBodyView: some View {
        ForEach(tabBtnList,id: \.id){ item in
            if mainVM.selectTab == item.index {
                VStack {
                    Spacer()
                    if(mainVM.selectTab == 0){
                        HomeView()
                    }else if(mainVM.selectTab == 1){
                        SongsView()
                    }else if(mainVM.selectTab == 2){
                        SettingsView()
                    }
                    Spacer()
                }
                .frame(width: .screenWidth, height: .screenHeight)
                .background(Color.bg)
            }
        }
    }
    
    var buildBottomView: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabBtnList,id: \.id){ item in
                    HStack{
                        Spacer()
                        TabBtn(tabBtnModel: item,isSelect: mainVM.selectTab == item.index) {
                            mainVM.selectTab = item.index
                        }
                        Spacer()
                    }
                }
            }
            .padding(.top,10)
            .padding(.bottom,.bottomInsets)
            .background(Color.bg)
            .shadow(radius: 5)
        }
    }
}

#Preview {
    MainTabView()
}
