//
//  MusicInfo.swift
//  demo03
//
//  Created by 宋晓明 on 2025/9/17.
//

import SwiftUI

struct MusicPlayBottomSheetView: View {
    
    @Binding var expandSheet: Bool
    var animation: Namespace.ID
    @EnvironmentObject var songManager: SongManager
    
    var body: some View {
        HStack(spacing: 0){
            ZStack{
                if !expandSheet {
                    GeometryReader {
                        let size = $0.size
                        AsyncImage(url: URL(string: songManager.song.cover)) { img in
                            img.resizable()
                                .scaledToFill()
                        } placeholder:{
                            ProgressView()
                                .background(.white.opacity(0.1))
                                .clipShape(.rect(cornerRadius: 5))
                        }
                        .frame(width: size.width,height: size.height)
                        .clipShape(.rect(cornerRadius: 60, style: .continuous))
                        
                        CircleProgressView(progress: 40)
                            .frame(width: size.width,height: size.height)
                        
                    }
                    .matchedGeometryEffect(id: "SONGCOVER", in: animation)
                }
                
            }
            .frame(width: 55,height: 55)
            
            Text("\(songManager.song.title)")
                .fontWeight(.semibold)
                .lineLimit(1)
                .padding(.horizontal,15)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "pause.fill")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .padding()
                    .background(.white)
                    .clipShape(Circle())
            }

        }
        .foregroundStyle(.white)
        .padding(.horizontal)
        .frame(height: 80)
        //.contentShape(.rect(topLeadingRadius: 30,topTrailingRadius: 30))
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)){
                expandSheet = true
            }
        }
    }
}

#Preview {
    MainPage()
        .preferredColorScheme(.dark)
}

struct CircleProgressView: View {
    
    let progress: Double
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.clear,lineWidth: 4)
            
            Circle()
                .trim(from: 0,to: 0.25)
                .stroke(Color.orange,style: StrokeStyle(lineWidth: 4,lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
        
    }
}
