//
//  ContentView.swift
//  demo06
//
//  Created by 宋晓明 on 2025/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var items: [NotesModel] = []
    
    var dataTools = DataTools.shared
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Notes")
                    .bold()
                    .font(.title)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                List {
                    NavigationLink(destination: AddNewView(order: items.count)) {
                        Text("Add New Note")
                                                    .frame(height:40)
                                                    .frame(maxWidth: .infinity)
                                                    .bold()
                                                    .cornerRadius(3.0)
                                                    .foregroundStyle(Color.orange)
                                                    .opacity(0.8)
                    }
                    
                    ForEach(items) { item in
                        NavigationLink(destination: EditContent(fileName: item.fileName,contentRow: item.content,star: item.star)) {
                            VStack {
                                HStack {
                                    Text(item.fileName)
                                                                                .frame(height:20)
                                                                                .frame(maxWidth: .infinity,alignment:.leading)
                                                                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                                                                .bold()
                                                                            
                                                                            Text(item.date.formatted())
                                                                                .font(.system(size: 10))
                                                                                .frame(height: 10)
                                                                                .frame(maxWidth: .infinity,alignment:.trailing)
                                                                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                                                            
                                                                            if(item.star){
                                                                                Image(systemName: "star.fill").foregroundStyle(Color.orange).imageScale(.small).frame(height: 10).opacity(0.9)
                                                                            }
                                }
                                
                                if(item.content != []){
                                                                        Text(item.content[0])
                                                                            .font(.system(size: 10))
                                                                            .frame(height: 10)
                                                                            .frame(maxWidth: .infinity,alignment:.leading)
                                                                            .bold()
                                                                            .opacity(0.5)
                                                                    }
                            }
                        }
                        .swipeActions(edge: .trailing) {
                            Button{
                            dataTools.delete(item: item)
                                                       
                                                        items = dataTools.getItems().reversed()
                                                        print("Refreshed on ContentView")
                                                    }label: {
                                                        Image(systemName: "trash")
                                                    }.tint(Color.red)
                        }
                        .swipeActions(edge: .leading) {
                            Button{
                                                            dataTools.togglestar(item: item)
                                                            items = dataTools.getItems().reversed()
                                                            print("Refreshed on ContentView")
                                                        }label: {
                                                            Image(systemName: "star.fill")
                                                        }.tint(Color.orange).opacity(0.9)
                        }
                    }
                    
                }
                .onAppear(){
                    items = dataTools.getItems().reversed()
                }
                
            }
        }
        .frame(alignment: .top)
    }
    
}

#Preview {
    ContentView()
}
