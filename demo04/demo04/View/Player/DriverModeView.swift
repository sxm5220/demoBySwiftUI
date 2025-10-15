//
//  DriverModeView.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/19.
//

import SwiftUI

struct DriverModeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var seekbarVal: Double = 0.5
   
    var body: some View {
        ZStack {
            VStack {
                buildTopView
                buildScrollView
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .background(Color.bg)
        .ignoresSafeArea()
    }
    
    var buildTopView: some View {
        HStack {
            Button {
                self.mode.wrappedValue.dismiss()
            } label: {
                Image("close")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
            
            Text("Driver Mode")
                .font(.customfont(.bold, fontSize: 18))
                .foregroundColor(.primaryText80)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Button {
                
            } label: {
                Image("playlist")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
        .padding(.top,.topInsets)
        .padding(.horizontal,20)
    }
    
    var buildScrollView: some View {
        ScrollView {
            ZStack {
                Image("player_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthPer(per: 0.4), height: .widthPer(per: 0.4))
                    .cornerRadius(.widthPer(per: 0.2))
                    .clipped()
            }
            .padding(.bottom,45)
            
            Text("Black or White")
                .font(.customfont(.medium, fontSize: 18))
                .foregroundColor(.primaryText.opacity(0.9))
                .padding(.bottom, 4)
            
            Text("Michael Jackson • Album - Dangerous")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(.primaryText60)
                .padding(.bottom, 15)
            
            Text("237 | 335")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(.primaryText60)
                .padding(.bottom, 40)
            
            VStack {
                Slider(value: $seekbarVal )
                    .accentColor(Color.focus)
                
                HStack{
                    Text("3:24")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.primaryText80)
                        .padding(.bottom, 40)
                    
                    Spacer()
                    
                    Text("5:24")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.primaryText80)
                        .padding(.bottom, 40)
                }
            }
            .padding(20)
            
            
            HStack(spacing: 25) {
                Button {
                    
                } label: {
                    Image("previous_song")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("next_song")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }

            }
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    DriverModeView()
        .preferredColorScheme(.dark)
}
